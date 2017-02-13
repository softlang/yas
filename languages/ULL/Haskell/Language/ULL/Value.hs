-- BEGIN ...
module Language.ULL.Value where
import Language.ULL.Syntax
-- END ...
-- ...
-- BEGIN ...
-- Boolean values
isBool :: Expr -> Bool
isBool TRUE = True
isBool FALSE = True
isBool _ = False

-- Natural numbers
isNat :: Expr -> Bool
isNat Zero = True
isNat (Succ e) = isNat e
isNat _ = False

-- Values
isValue :: Expr -> Bool
isValue e = isBool e || isNat e || isLambda e
  where
    isLambda (Lambda _ _) = True
    isLambda _ = False
-- END ...
-- Convert Haskell Int to expression such that isNat is True
fromInt :: Int -> Expr
fromInt i | i >= 0 = if i == 0 then Zero else Succ (fromInt (i-1))

-- Convert expression such that isNat is True to Haskell Int
toInt :: Expr -> Int
toInt Zero = 0
toInt (Succ e) = toInt e + 1
