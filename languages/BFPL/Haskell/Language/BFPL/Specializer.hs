-- BEGIN ...
module Language.BFPL.Specializer where

import Language.BFPL.Syntax
import Language.BFPL.Domains
import Language.BFPL.Interpreter (uop, bop)
import Language.BFPL.Inliner (exprToValue, valueToExpr, getValue, isValue)
import Data.Map (Map, lookup, empty, fromList)
import Data.Tuple
import Data.Maybe
-- import Data.Hashable
import Control.Monad.State

-- Return a residual (specialized) program
peval :: Program -> Program
peval (fs, e) = swap (runState (f e empty) [])
  where
    f :: Expr -> Env -> State [Function] Expr
    f e@(IntConst _) _ = return e
    f e@(BoolConst _) _ = return e
    f e@(Arg x) env =
      case Data.Map.lookup x env of
        (Just e') -> return (valueToExpr e')
        Nothing -> return e
    f (If e0 e1 e2) env = do
      r0 <- f e0 env
      let r1 = f e1 env
      let r2 = f e2 env
      case exprToValue r0 of
        Nothing -> r1 >>= \r1' -> r2 >>= \r2' -> return (If r0 r1' r2')
        (Just (Right bv)) -> if bv then r1 else r2
    f (Unary o e) env = do
      r <- f e env
      case exprToValue r of
        (Just v) -> return (valueToExpr (uop o v))
        _ -> return (Unary o r)
    f (Binary o e1 e2) env = do
      r1 <- f e1 env
      r2 <- f e2 env
      case (exprToValue r1, exprToValue r2) of
        (Just v1, Just v2) -> return (valueToExpr (bop o v1 v2))
        _ -> return (Binary o r1 r2)
-- END ...
    f (Apply fn es) env = do
      -- Look up function
      let Just ((ts, t), (ns, body)) = Prelude.lookup fn fs
      -- Partially evaluate arguments
      rs <- mapM (flip f env) es
      -- Determine static and dynamic arguments
      let trs = zip ts rs
      let ntrs = zip ns trs
      let sas = [ (n, getValue r) | (n, (_, r)) <- ntrs, isValue r ]
      let das = [ (n, (t, r)) | (n, (t, r)) <- ntrs, not (isValue r) ]
      -- Specialize body
      let body' = f body (fromList sas)
      if null das
      -- Inline
        then body' 
      -- Specialize
        else do
          -- Fabricate function name
          let fn' = fn ++ show sas
          fs' <- get
          -- Memoize new residual function, if necessary
          when (isNothing (Prelude.lookup fn' fs')) (do
            -- Create placeholder for memoization
            put (fs' ++ [(fn', undefined)])
            -- Partially evaluate function body
            body'' <- body'
            -- Define residual
            let r = ((map (fst . snd) das, t), (map fst das, body''))
            -- Replace placeholder by actual definition
            modify (update (const r) fn'))
          -- Apply the specialized function
          return (Apply fn' (map (snd . snd) das))
-- BEGIN ...

-- Update a list that is supposed to be a map/dictionary
update :: Eq k => (v -> v) -> k -> [(k,v)] -> [(k,v)]
update f k ((k',v):kvs) = if k==k' then (k',f v):kvs else (k',v):update f k kvs
-- END ...
