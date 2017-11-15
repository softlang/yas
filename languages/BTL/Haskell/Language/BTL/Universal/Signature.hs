-- BEGIN ...
module Language.BTL.Universal.Signature where
import Language.BSL.Syntax
-- END ...
btlSignature :: Signature
btlSignature =
  [ ("true", [], "expr"),
    ("false", [], "expr"),
    ("zero", [], "expr"),
    ("succ", ["expr"], "expr"),
    ("pred", ["expr"], "expr"),
    ("iszero", ["expr"], "expr"),
    ("if", ["expr", "expr", "expr"], "expr")
  ]
