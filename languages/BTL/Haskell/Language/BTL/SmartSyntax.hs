-- BEGIN ...
-- Smart constructors for BTL terms
module Language.BTL.SmartSyntax where
import Language.BTL.Syntax
-- END ...
true, false, zero :: Maybe Expr
true = Just TRUE
false = Just FALSE
zero = Just Zero
succ, pred, iszero :: Expr -> Maybe Expr
succ e = if isNat e then Just (Succ e) else Nothing
pred e = if isNat e then Just (Pred e) else Nothing
iszero e = if isNat e then Just (IsZero e) else Nothing
ifthenelse :: Expr -> Expr -> Expr -> Maybe Expr
ifthenelse e1 e2 e3 =
  if isBool e1 && (isNat e2 && isNat e3 || isBool e2 && isBool e3)
    then Just (If e1 e2 e3)
    else Nothing

isNat, isBool :: Expr -> Bool
isNat Zero = True
isNat (Succ _) = True
isNat (Pred _) = True
isNat (If _ e _) = isNat e
isNat _ = False
isBool = not . isNat
