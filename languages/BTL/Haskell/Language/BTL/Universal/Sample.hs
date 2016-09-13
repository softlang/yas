-- BEGIN ...
module Language.BTL.Universal.Sample where
import Data.TermRep
-- END ...
sampleExpr :: TermRep
sampleExpr =
  TermRep "Pred" [
    TermRep "If" [
      TermRep "IsZero" [TermRep "Zero" []],
      TermRep "Succ" [TermRep "Succ" [TermRep "Zero" []]],
      TermRep "Zero" [] ]]
