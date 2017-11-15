-- BEGIN ...
module Language.BNL.Universal.Signature where
import Language.BSL.Syntax
-- END ...
bnlSignature :: Signature
bnlSignature =
  [ ("number", ["bits", "rest"], "number"),
    ("single", ["bit"], "bits"),
    ("many", ["bit", "bits"], "bits"),
    ("zero", [], "bit"), ("one", [], "bit"),
    ("integer", [], "rest"),
    ("rational", ["bits"], "rest") ]
