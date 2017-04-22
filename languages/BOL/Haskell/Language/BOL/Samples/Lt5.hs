module Language.BOL.Samples.Lt5 where
import Language.BOL.Syntax

-- Two classes with some properties
-- TODO: implement type checking
mm :: MM
mm = [a, b]
 where
  a = ("a", [("bs", ListType (RefType "b"))])
  b = ("b", [("c", IntType)])

invI, invJ, invK :: Inv

-- For all a's, there is a "b" among the "bs" such as "b.c < 5".
invI = ("A", Exists (Dot Self "bs") "b" (Lt (Dot (Var "b") "c") (Int 5)))

-- For all a's, for all their "b"s among the "bs", "b.c < 5".
invJ = ("A", ForAll (Dot Self "bs") "b" (Lt (Dot (Var "b") "c") (Int 5)))

-- For all a's, there is a "b" among the "bs" such as "b.c > 1".
invK = ("A", Exists (Dot Self "bs") "b" (Lt (Int 1) (Dot (Var "b") "c")))
