-- BEGIN ...
module Language.BSL.Sample where
import Language.BSL.Syntax
import Data.TermRep
-- END ...
sampleSignature = 
  [ ("number", ["bits", "rest"], "number"),
    ("single", ["bit"], "bits"),
    ("many", ["bit", "bits"], "bits"),
    ("zero", [], "bit"), ("one", [], "bit"),
    ("integer", [], "rest"),
    ("rational", ["bits"], "rest") ]

sampleTermRep =
  TermRep "number" [
    TermRep "many" [
      TermRep "one" [],
      TermRep "single" [
        TermRep "zero" []
      ]
    ],
    TermRep "integer" []
  ]
