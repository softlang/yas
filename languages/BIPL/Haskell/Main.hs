import qualified Language.BIPL.Sample
import qualified Language.BIPL.Goto.Sample
import qualified Language.BIPL.Sign.Sample
import Language.BIPL.Typing
import Language.BIPL.Interpreter as V0
import Language.BIPL.DS.Interpreter as V1
import Language.BIPL.CS.Interpreter as V2
import Language.BIPL.Goto.Interpreter as V3
import Language.BIPL.Algebra.Scheme as V4a
import Language.BIPL.Algebra.Interpretation as V4b
import Language.BIPL.Sign.V1.Analysis as V4c1
import Language.BIPL.Sign.V2.Analysis as V4c2
import Language.BIPL.Compiler
import Language.AL.Assembler
import Language.ML.Machine
import Data.Map (empty)

s = Language.BIPL.Sample.sample
s' = Language.BIPL.Goto.Sample.sample
facv1 = Language.BIPL.Sign.Sample.factorialV1
facv2 = Language.BIPL.Sign.Sample.factorialV2 
sto'' = Language.BIPL.Sign.Sample.store
s_al = compile s
s_ml = assemble s_al

main = do
  print $ okStmt s empty
  print $ V0.execute s empty
  print $ V1.execute s empty
  print $ V2.execute' s empty
  print $ V3.execute' s' empty
  print $ V4a.interpret (V4b.interpretation) s empty
  print $ V4a.interpret (V4c1.analysis) facv1 sto''
  print $ V4a.interpret (V4c2.analysis) facv1 sto''
  print $ V4a.interpret (V4c1.analysis) facv2 sto''
  print $ V4a.interpret (V4c2.analysis) facv2 sto''
  print $ s_al
  print $ s_ml
  print $ run s_ml

