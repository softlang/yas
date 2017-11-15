-- BEGIN ...
module Language.BNL.Universal.Sample where
import Data.TermRep
-- END ...
sampleNumber :: TermRep
sampleNumber =
  TermRep "number" [
    TermRep "many" [
      TermRep "one" [],
      TermRep "single" [
        TermRep "zero" []
      ]
    ],
    TermRep "integer" []
  ]
