-- BEGIN ...
module Language.BFPL.Typing where
import Language.BFPL.Syntax
-- END ...
-- Types for types
type Context = [(String, SimpleType)]

-- Well-typedness of programs
okProgram :: Program -> Bool
okProgram (fs, e) = okFunctions && okMain
  where
    okFunctions = and (map (okFunction fs) fs)
    okMain = maybe False (const True) (typeOfExpr fs [] e)

-- Well-typedness of a function
okFunction :: [Function] -> Function -> Bool
okFunction fs (_, ((ts, res), (ns, body))) = okLength && maybe False (==res) okBody
  where
    okLength = length ns == length ts
    okBody = typeOfExpr fs m body
    m = zip ns ts

-- Type analysis of expressions
typeOfExpr :: [Function] -> Context -> Expr -> Maybe SimpleType
typeOfExpr _ _ (IntConst _) = Just Int
typeOfExpr _ _ (BoolConst _) = Just Bool
typeOfExpr fs m (Arg x) = lookup x m
typeOfExpr fs m (If e0 e1 e2)
  = do
       t0 <- typeOfExpr fs m e0
       t1 <- typeOfExpr fs m e1
       t2 <- typeOfExpr fs m e2
       if t0 == Bool && t1 == t2 then Just t1 else Nothing
typeOfExpr fs m (Unary o e)
  = do
       t <- typeOfExpr fs m e
       case (o, t) of
         (Negate, Int) -> Just Int
         (Not, Bool) -> Just Bool
         _ -> Nothing
typeOfExpr fs m (Binary o e1 e2)
  = do
       -- ...
-- BEGIN ...
       t1 <- typeOfExpr fs m e1
       t2 <- typeOfExpr fs m e2
       case (o, t1, t2) of
         (Add, Int, Int) -> Just Int
         (Sub, Int, Int) -> Just Int
         (Mul, Int, Int) -> Just Int
         (Eq, Int, Int) -> Just Bool
         (_, _, _) -> Nothing
-- END ...         
typeOfExpr fs m (Apply fn es)
  = do
       ((ts, r), _) <- lookup fn fs
       ts' <- mapM (typeOfExpr fs m) es
       if ts == ts' then Just r else Nothing
