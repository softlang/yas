-- BEGIN ...
module Language.BLL.Substitution where
import Language.BLL.Syntax
-- END ...
substitute :: Expr -> String -> Expr -> Maybe Expr
substitute e x (Var y) | x == y = Just e
substitute e x (Var y) | x /= y = Just (Var y)
substitute e x (Apply e1 e2) = do
  e1' <- substitute e x e1
  e2' <- substitute e x e2
  Just (Apply e1' e2')
substitute e x (Lambda y t e') | x == y =
  Just (Lambda y t e')
substitute e x (Lambda y t e') | x /= y && not (elem y (free e)) = do
  e'' <- substitute e x e'
  Just (Lambda y t e'')
substitute e x (Fix e') = substitute e x e' >>= Just . Fix
-- ...
-- BEGIN ...
substitute e x TRUE = Just TRUE
substitute e x FALSE = Just FALSE
substitute e x Zero = Just Zero
substitute e x (Succ e') = substitute e x e' >>= Just . Succ
substitute e x (Pred e') = substitute e x e' >>= Just . Pred
substitute e x (IsZero e') = substitute e x e' >>= Just . IsZero
substitute e x (If e1 e2 e3) = do
  e1' <- substitute e x e1
  e2' <- substitute e x e2
  e3' <- substitute e x e3
  Just (If e1' e2' e3')
-- END ...
substitute _ _ _ = Nothing

free :: Expr -> [String]
free (Var x) = [x]
free (Apply e1 e2) = free e1 `union` free e2
free (Lambda x _ e) = [ y | y <- free e, y /= x]
-- ...
-- BEGIN ...
free TRUE = []
free FALSE = []
free Zero = []
free (Succ e) = free e
free (Pred e) = free e
free (IsZero e) = free e
free (If e1 e2 e3) = free e1 `union` free e2 `union` free e3
free (Fix e) = free e

union xs ys = xs ++ [ x | x <- ys, not (elem x xs) ]
-- END ...
