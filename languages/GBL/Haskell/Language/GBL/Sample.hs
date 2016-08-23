-- BEGIN ...
module Language.GBL.Sample where
import Language.GBL.Syntax
-- END ...
smallWorld :: World
smallWorld = World [p1, p2]
  where
    p1, p2 :: Person
    p1 = Person { getName = "joe", getBuddy = Just p2 }
    p2 = Person { getName = "bill", getBuddy = Just p1 }
