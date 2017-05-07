-- BEGIN ...
module Language.TBL.Sample where
import Language.TBL.Syntax
-- END ...
smallWorld :: World
smallWorld = World [
    Person { getName = "joe", getBuddy = Just "bill" },
    Person { getName = "bill", getBuddy = Just "joe" }
  ]
