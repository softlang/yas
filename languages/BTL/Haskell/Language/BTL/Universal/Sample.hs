-- BEGIN ...
module Language.BTL.Universal.Sample where
import Data.TermRep
-- END ...
sampleExpr :: TermRep
sampleExpr =
  TermRep "pred" [
    TermRep "if" [
      TermRep "iszero" [TermRep "zero" []],
      TermRep "succ" [TermRep "succ" [TermRep "zero" []]],
      TermRep "zero" [] ]]
