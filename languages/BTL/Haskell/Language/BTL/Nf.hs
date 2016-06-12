-- BEGIN ...
-- Normal form in the operational semantics
module Language.BTL.Nf where

import Language.BTL.Syntax
-- END ...
-- Boolean values
isBool :: Term -> Bool
isBool TRUE = True
isBool FALSE = True
isBool _ = False

-- Natural numbers
isNat :: Term -> Bool
isNat Zero = True
isNat (Succ t) = isNat t
isNat _ = False

-- Values
isValue :: Term -> Bool
isValue t = isBool t || isNat t
