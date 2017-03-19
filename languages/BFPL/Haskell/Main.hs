import Language.BFPL.Samples.Factorial as F
import Language.BFPL.Samples.Power as P
import Language.BFPL.Syntax
import Language.BFPL.TypeChecker
import Language.BFPL.Interpreter
import Language.BFPL.Inliner as I 
import Language.BFPL.Specializer as S

main = do
  print $ okProgram F.factorial
  print $ evaluate F.factorial
  print $ okProgram ([power], (Apply "power" [IntConst 3, IntConst 2]))
  print $ evaluate ([power], (Apply "power" [IntConst 3, IntConst 2]))
  print $ I.peval ([power], (Apply "power" [IntConst 3, IntConst 2]))
  print $ S.peval ([power], (Apply "power" [IntConst 3, IntConst 2]))
  print $ I.peval ([power], (Apply "power" [IntConst 3, Arg "x"]))
  print $ S.peval ([power], (Apply "power" [IntConst 3, Arg "x"]))
  print $ S.peval ([power], (Apply "power" [Arg "n", IntConst 2]))
