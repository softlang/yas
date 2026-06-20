import qualified Language.BIPL.Sample
import qualified Language.BIPL.Goto.Sample
import qualified Language.BIPL.Analysis.Sign.Sample
import qualified Language.BIPL.Analysis.TypeState.Sample
import qualified Language.BIPL.Analysis.DeadCode.Sample
import qualified Language.BIPL.Analysis.Interval.Sample
import qualified Language.BIPL.Analysis.Termination.Sample
import qualified Language.BIPL.Analysis.Slicing.Sample
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
import Language.BIPL.Analysis.Sign.BasicAnalysis as V4c1
import Language.BIPL.Analysis.Sign.RefinedAnalysis as V4c2
import Language.BIPL.Analysis.TypeState.BasicAnalysis as TypeState
import qualified Language.BIPL.Analysis.DeadCode.BasicAnalysis as DeadCode
import Language.BIPL.Analysis.Interval.BasicAnalysis as Interval
import qualified Language.BIPL.Analysis.Termination.BasicAnalysis as Termination
import qualified Language.BIPL.Analysis.Slicing.BasicAnalysis as Slicing
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
facv1 = Language.BIPL.Analysis.Sign.Sample.factorialV1
facv2 = Language.BIPL.Analysis.Sign.Sample.factorialV2
sto'' = Language.BIPL.Analysis.Sign.Sample.store
test1 = Language.BIPL.Analysis.Sign.Sample.test1
test1sto = Language.BIPL.Analysis.Sign.Sample.store1
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

  -- Existing sign-analysis examples
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

  -- Type-state analysis as abstract interpretation
  print $ V4a.interpret TypeState.algebra Language.BIPL.Analysis.TypeState.Sample.sameTypeOk Language.BIPL.Analysis.TypeState.Sample.sameTypeOkStore
  print $ V4a.interpret TypeState.algebra Language.BIPL.Analysis.TypeState.Sample.reassignmentError Language.BIPL.Analysis.TypeState.Sample.reassignmentErrorStore
  print $ V4a.interpret TypeState.algebra Language.BIPL.Analysis.TypeState.Sample.branchError Language.BIPL.Analysis.TypeState.Sample.branchErrorStore
  print $ V4a.interpret TypeState.algebra Language.BIPL.Analysis.TypeState.Sample.guardError Language.BIPL.Analysis.TypeState.Sample.guardErrorStore
  print $ V4a.interpret TypeState.algebra Language.BIPL.Analysis.TypeState.Sample.loopOk Language.BIPL.Analysis.TypeState.Sample.loopOkStore

  -- Dead-branch / unreachable-code analysis
  print $ DeadCode.analyze Language.BIPL.Analysis.DeadCode.Sample.deadElse Language.BIPL.Analysis.DeadCode.Sample.deadElseStore
  print $ DeadCode.analyze Language.BIPL.Analysis.DeadCode.Sample.deadThen Language.BIPL.Analysis.DeadCode.Sample.deadThenStore
  print $ DeadCode.analyze Language.BIPL.Analysis.DeadCode.Sample.unknownBranch Language.BIPL.Analysis.DeadCode.Sample.unknownBranchStore
  print $ DeadCode.analyze Language.BIPL.Analysis.DeadCode.Sample.deadLoopBody Language.BIPL.Analysis.DeadCode.Sample.deadLoopBodyStore
  print $ DeadCode.analyze Language.BIPL.Analysis.DeadCode.Sample.nestedDeadBranch Language.BIPL.Analysis.DeadCode.Sample.nestedDeadBranchStore

  -- Interval analysis as abstract interpretation
  print $ V4a.interpret Interval.algebra Language.BIPL.Analysis.Interval.Sample.boundedArithmetic Language.BIPL.Analysis.Interval.Sample.boundedArithmeticStore
  print $ V4a.interpret Interval.algebra Language.BIPL.Analysis.Interval.Sample.counterLoop Language.BIPL.Analysis.Interval.Sample.counterLoopStore
  print $ V4a.interpret Interval.algebra Language.BIPL.Analysis.Interval.Sample.finiteProduct Language.BIPL.Analysis.Interval.Sample.finiteProductStore
  print $ V4a.interpret Interval.algebra Language.BIPL.Analysis.Interval.Sample.unknownBranch Language.BIPL.Analysis.Interval.Sample.unknownBranchStore
  print $ V4a.interpret Interval.algebra Language.BIPL.Analysis.Interval.Sample.rangedLoop Language.BIPL.Analysis.Interval.Sample.rangedLoopStore

  -- Termination-ish / loop-variant analysis
  print $ Termination.analyze Language.BIPL.Analysis.Termination.Sample.decrementToZero
  print $ Termination.analyze Language.BIPL.Analysis.Termination.Sample.incrementToLimit
  print $ Termination.analyze Language.BIPL.Analysis.Termination.Sample.movesAwayFromBound
  print $ Termination.analyze Language.BIPL.Analysis.Termination.Sample.guardVariableUnchanged
  print $ Termination.analyze Language.BIPL.Analysis.Termination.Sample.unknownBooleanGuard
  print $ Termination.analyze Language.BIPL.Analysis.Termination.Sample.unknownConditionalUpdate

  -- Dependency / slicing analysis
  print $ Slicing.analyze Language.BIPL.Analysis.Slicing.Sample.straightLine Language.BIPL.Analysis.Slicing.Sample.straightLineStore
  print $ Slicing.analyze Language.BIPL.Analysis.Slicing.Sample.controlDependency Language.BIPL.Analysis.Slicing.Sample.controlDependencyStore
  print $ Slicing.analyze Language.BIPL.Analysis.Slicing.Sample.combinedDependency Language.BIPL.Analysis.Slicing.Sample.combinedDependencyStore
  print $ Slicing.analyze Language.BIPL.Analysis.Slicing.Sample.loopDependency Language.BIPL.Analysis.Slicing.Sample.loopDependencyStore
  print $ Slicing.analyze Language.BIPL.Analysis.Slicing.Sample.preSeededDependency Language.BIPL.Analysis.Slicing.Sample.preSeededDependencyStore
