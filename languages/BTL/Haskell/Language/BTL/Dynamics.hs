-- BEGIN ...
module Language.BTL.Dynamics where
import Data.TermRep
-- END ...
expr :: TermRep -> Bool
expr (TermRep "true" []) = True
expr (TermRep "false" []) = True
expr (TermRep "zero" []) = True
expr (TermRep "succ" [e]) = expr e
expr (TermRep "pred" [e]) = expr e
expr (TermRep "iszero" [e]) = expr e
expr (TermRep "if" es@[_,_,_]) = and (map expr es)
expr _ = False
