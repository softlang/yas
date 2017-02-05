import qualified Language.BIPL.Sample
import qualified Language.BIPL.Goto.Sample
import qualified Language.BIPL.Analysis.Sample
import qualified Language.BAL.Sample
import qualified Language.BML.Sample
import Language.BIPL.TypeChecker as Typing1
import Language.BIPL.MonadicAlgebra.TypeChecker as Typing2
import Language.BIPL.Interpreter as V0
import Language.BIPL.DS.Interpreter as V1
import Language.BIPL.CS.Interpreter as V2
import Language.BIPL.Goto.Interpreter as V3
import Language.BIPL.Algebra.Scheme as V4a
import Language.BIPL.Algebra.StandardInterpreter as V4b
import Language.BIPL.Analysis.BasicAnalysis as V4c1
import Language.BIPL.Analysis.RefinedAnalysis as V4c2
import Language.BIPL.MonadicAlgebra.Scheme as V5a
import Language.BIPL.MonadicAlgebra.Interpretation as V5b
import Language.BIPL.Extraction                    
import Language.BIPL.Compiler
import Language.BAL.Assembler
import Language.BML.Machine
import Language.BIPL.Rename.Transformation
import Data.Map (empty, keys, fromList)

s = Language.BIPL.Sample.euclideanDiv
s' = Language.BIPL.Goto.Sample.euclideanDiv
facv1 = Language.BIPL.Analysis.Sample.factorialV1
facv2 = Language.BIPL.Analysis.Sample.factorialV2 
sto'' = Language.BIPL.Analysis.Sample.store
test1 = Language.BIPL.Analysis.Sample.test1 
test1sto = Language.BIPL.Analysis.Sample.store1
s_al = compile (Language.BIPL.Sample.addArguments s)
s_ml = assemble s_al

main = do
  print $ V0.execute s (fromList [("x", Left 13), ("y", Left 4)])
  print $ V1.execute s (fromList [("x", Left 13), ("y", Left 4)])
  print $ V2.execute s (fromList [("x", Left 13), ("y", Left 4)])
  print $ V3.execute s' (fromList [("x", Left 13), ("y", Left 4)])
  print $ V4a.interpret V4b.algebra s (fromList [("x", Left 13), ("y", Left 4)])
  print $ maybe undefined id (V5a.interpret (V5b.interpretation) s (fromList [("x", Left 13), ("y", Left 4)]))
  print $ Typing1.okStmt s (fromList [("x", Typing1.IntType), ("y", Typing1.IntType)])
  print $ V5a.interpret Typing2.algebra s (fromList [("x", Typing2.IntType), ("y", Typing2.IntType)])
  print $ V4a.interpret (V4c1.algebra) facv1 sto''
  print $ V4a.interpret (V4c2.algebra) facv1 sto''
  print $ V4a.interpret (V4c1.algebra) facv2 sto''
  print $ V4a.interpret (V4c2.algebra) facv2 sto''
  print $ s_al == Language.BAL.Sample.euclideanDiv
  print $ s_ml == Language.BML.Sample.euclideanDiv
  print $ run s_ml
  print $ ops s
  print $ bottoms test1sto
  print $ maps (keys test1sto)
  print $ V4a.interpret (V4c2.algebra) test1 test1sto
