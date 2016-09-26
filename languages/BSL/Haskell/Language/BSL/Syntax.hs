-- BEGIN ...
module Language.BSL.Syntax where
-- END ...
type Signature = [Profile]
type Profile = (Sym, [Sort], Sort)
type Sym = String
type Sort = String
