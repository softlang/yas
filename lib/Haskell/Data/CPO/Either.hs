-- BEGIN ...
module Data.CPO.Either where
import Data.CPO
-- END ...
instance (CPO a, CPO b) => CPO (Either a b) where
  pord (Left s) (Left s') = pord s s'
  pord (Right b) (Right b') = pord b b'
  pord _ _ = False
  lub (Left s) (Left s') = Left (lub s s')
  lub (Right b) (Right b') = Right (lub b b')
