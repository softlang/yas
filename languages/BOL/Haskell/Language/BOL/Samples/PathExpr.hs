module Language.BOL.Samples.PathExpr where
import Language.BOL.Syntax

-- Three classes with some properties
-- TODO: implement type checking
mm :: MM
mm = [a, b, c]
 where
  a = ("a", [("x", IntType), ("b", RefType "b")])
  b = ("b", [("y", IntType), ("c", RefType "c")])
  c = ("c", [("z", IntType)])

-- self.x < self.b.y and self.x < self.b.c.z
inv :: Inv
inv
 = ("A",
         Conj
           (Lt (Dot Self "x") (Dot (Dot Self "b") "y"))
           (Lt (Dot Self "x") (Dot (Dot (Dot Self "b") "c") "z"))
   )
