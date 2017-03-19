-- BEGIN ...
module Language.BFPL.Inliner where
import Language.BFPL.Syntax
import Language.BFPL.Domains hiding (Env)
import Language.BFPL.Interpreter (uop, bop)
import Data.Map (Map, lookup, empty, fromList)
import Data.Maybe
-- END ...
type Env = Map String Expr

peval :: Program -> Expr
peval (fs, e) = f e empty
  where
    f :: Expr -> Env -> Expr
    f e@(IntConst _) _ = e
    f e@(BoolConst _) _ = e
    f e@(Arg x) env =
      case Data.Map.lookup x env of
        (Just e') -> e'
        Nothing -> e
    f (If e0 e1 e2) env =
      let
        r0 = f e0 env
        r1 = f e1 env
        r2 = f e2 env
      in
       case toValue r0 of
         (Just (Right bv)) -> if bv then r1 else r2
         Nothing -> If r0 r1 r2
    f (Unary o e) env =
      let r = f e env
      in case toValue r of
           (Just v) -> fromValue (uop o v)
           _ -> Unary o r
    f (Binary o e1 e2) env = -- ...
-- BEGIN ...
      let
        r1 = f e1 env
        r2 = f e2 env
      in case (toValue r1, toValue r2) of
           (Just v1, Just v2) -> fromValue (bop o v1 v2)
           _ -> Binary o r1 r2
-- END ...
    f (Apply fn es) env = f body env'
      where
        Just (_, (ns, body)) = Prelude.lookup fn fs
        rs = map (flip f env) es
        env' = fromList (zip ns rs)

-- Attempt extraction of value from expression
toValue :: Expr -> Maybe Value
toValue (IntConst iv) = Just (Left iv)
toValue (BoolConst bv) = Just (Right bv)
toValue _ = Nothing

-- Represent value as expression
fromValue :: Value -> Expr
fromValue (Left iv) = IntConst iv
fromValue (Right bv) = BoolConst bv
