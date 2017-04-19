module Language.BOL.Sample where
import Language.BOL.Syntax

-- Two classes with some properties
mm :: MM
mm = [a, b]
 where
  a = ("a", [("bs", ListType (RefType "b"))])
  b = ("b", [("c", IntType)])

-- For all a's, there is a "b" among the "bs" such as "b.c < 5".
inv :: Inv
inv = ("A", Exists (Dot Self "bs") "b" (Lt (Dot (Var "b") "c") (Int 5)))