import Language.BFPL.Samples.Factorial as F
import Language.BFPL.Samples.Exp as E
import Language.BFPL.Syntax
import Language.BFPL.Typing
import Language.BFPL.Interpreter
import Language.BFPL.Inliner as I 
import Language.BFPL.Specializer as S
import Prelude hiding (exp)

main = do
  print $ okProgram F.sample
  print $ eval F.sample
  print $ okProgram ([exp], (Apply "exp" [IntConst 2, IntConst 3]))
  print $ eval ([exp], (Apply "exp" [IntConst 2, IntConst 3]))
  print $ I.peval ([exp], (Apply "exp" [IntConst 2, IntConst 3]))
  print $ S.peval ([exp], (Apply "exp" [IntConst 2, IntConst 3]))
  print $ I.peval ([exp], (Apply "exp" [Arg "x", IntConst 3]))
  print $ S.peval ([exp], (Apply "exp" [Arg "x", IntConst 3]))
  print $ S.peval ([exp], (Apply "exp" [IntConst 2, Arg "n"]))
