-- For stores, environments and such
import Data.Map (empty, keys, fromList)

-- Samples
import qualified Language.BIPL.Sample
import qualified Language.BIPL.Goto.Sample
import qualified Language.BIPL.Analysis.Sign.Sample
import qualified Language.BIPL.Analysis.TypeState.Sample
import qualified Language.BIPL.Analysis.DeadCode.Sample
import qualified Language.BIPL.Analysis.Interval.Sample
import qualified Language.BIPL.Analysis.Termination.Sample
import qualified Language.BIPL.Analysis.Slicing.Sample
import qualified Language.BIPL.Analysis.InformationFlow.Sample
import qualified Language.BAL.Sample
import qualified Language.BML.Sample

-- Type-checking
import Language.BIPL.TypeChecker as Typing1
import Language.BIPL.MonadicAlgebra.TypeChecker as Typing2

-- Some interpreters
import Language.BIPL.Interpreter as Interpreter
import Language.BIPL.DS.Interpreter as InterpreterDS
import Language.BIPL.CS.Interpreter as InterpreterCS
import Language.BIPL.Goto.Interpreter as InterpreterGoto
import Language.BIPL.Algebra.StandardInterpreter as InterpreterAlgebra
import Language.BIPL.MonadicAlgebra.StandardInterpreter as InterpreterMonadicAlgebra

-- Algebras
import Language.BIPL.Algebra.Scheme as Algebra
import Language.BIPL.MonadicAlgebra.Scheme as MonadicAlgebra

-- Analyses
import Language.BIPL.Analysis.Sign.BasicAnalysis as Sign1
import Language.BIPL.Analysis.Sign.RefinedAnalysis as Sign2
import Language.BIPL.Analysis.TypeState.BasicAnalysis as TypeState
import Language.BIPL.Analysis.DeadCode.BasicAnalysis as DeadCode
import Language.BIPL.Analysis.Interval.BasicAnalysis as Interval
import Language.BIPL.Analysis.Termination.BasicAnalysis as Termination
import Language.BIPL.Analysis.Slicing.BasicAnalysis as Slicing
import Language.BIPL.Analysis.InformationFlow.BasicAnalysis as InformationFlow

-- Other language processors to be tested
import Language.BIPL.Extraction
import Language.BIPL.Compiler
import Language.BAL.Assembler
import Language.BML.Machine
import Language.BIPL.Rename.Transformation

s = Language.BIPL.Sample.euclideanDiv
s' = Language.BIPL.Goto.Sample.euclideanDiv

facv1 = Language.BIPL.Analysis.Sign.Sample.factorialV1
facv2 = Language.BIPL.Analysis.Sign.Sample.factorialV2
sto'' = Language.BIPL.Analysis.Sign.Sample.store

test1 = Language.BIPL.Analysis.Sign.Sample.test1
test1sto = Language.BIPL.Analysis.Sign.Sample.store1

s_al = compile (Language.BIPL.Sample.addArguments s)
s_ml = assemble s_al

main_interpretation = do
  print $ Interpreter.execute s (fromList [("x", Left 13), ("y", Left 4)])
  print $ InterpreterDS.execute s (fromList [("x", Left 13), ("y", Left 4)])
  print $ InterpreterCS.execute s (fromList [("x", Left 13), ("y", Left 4)])
  print $ InterpreterGoto.execute s' (fromList [("x", Left 13), ("y", Left 4)])
  print $ Algebra.interpret InterpreterAlgebra.algebra s (fromList [("x", Left 13), ("y", Left 4)])
  print $ maybe undefined id (MonadicAlgebra.interpret (InterpreterMonadicAlgebra.algebra) s (fromList [("x", Left 13), ("y", Left 4)]))

main_typechecking = do
  print $ Typing1.okStmt s (fromList [("x", Typing1.IntType), ("y", Typing1.IntType)])
  print $ MonadicAlgebra.interpret Typing2.algebra s (fromList [("x", Typing2.IntType), ("y", Typing2.IntType)])

main_type_state_analysis = do
  print $ Algebra.interpret TypeState.algebra Language.BIPL.Analysis.TypeState.Sample.sameTypeOk Language.BIPL.Analysis.TypeState.Sample.sameTypeOkStore
  print $ Algebra.interpret TypeState.algebra Language.BIPL.Analysis.TypeState.Sample.reassignmentError Language.BIPL.Analysis.TypeState.Sample.reassignmentErrorStore
  print $ Algebra.interpret TypeState.algebra Language.BIPL.Analysis.TypeState.Sample.branchError Language.BIPL.Analysis.TypeState.Sample.branchErrorStore
  print $ Algebra.interpret TypeState.algebra Language.BIPL.Analysis.TypeState.Sample.guardError Language.BIPL.Analysis.TypeState.Sample.guardErrorStore
  print $ Algebra.interpret TypeState.algebra Language.BIPL.Analysis.TypeState.Sample.loopOk Language.BIPL.Analysis.TypeState.Sample.loopOkStore

main_sign_analysis = do
  print $ Algebra.interpret (Sign1.algebra) facv1 sto''
  print $ Algebra.interpret (Sign2.algebra) facv1 sto''
  print $ Algebra.interpret (Sign1.algebra) facv2 sto''
  print $ Algebra.interpret (Sign2.algebra) facv2 sto''
  print $ s_al == Language.BAL.Sample.euclideanDiv
  print $ s_ml == Language.BML.Sample.euclideanDiv
  print $ run s_ml
  print $ ops s
  print $ bottoms test1sto
  print $ maps (keys test1sto)
  print $ Algebra.interpret (Sign2.algebra) test1 test1sto

main_interval_analysis = do
  print $ Algebra.interpret Interval.algebra Language.BIPL.Analysis.Interval.Sample.boundedArithmetic Language.BIPL.Analysis.Interval.Sample.boundedArithmeticStore
  print $ Algebra.interpret Interval.algebra Language.BIPL.Analysis.Interval.Sample.counterLoop Language.BIPL.Analysis.Interval.Sample.counterLoopStore
  print $ Algebra.interpret Interval.algebra Language.BIPL.Analysis.Interval.Sample.finiteProduct Language.BIPL.Analysis.Interval.Sample.finiteProductStore
  print $ Algebra.interpret Interval.algebra Language.BIPL.Analysis.Interval.Sample.unknownBranch Language.BIPL.Analysis.Interval.Sample.unknownBranchStore
  print $ Algebra.interpret Interval.algebra Language.BIPL.Analysis.Interval.Sample.rangedLoop Language.BIPL.Analysis.Interval.Sample.rangedLoopStore

main_dead_code_analysis = do
  print $ DeadCode.analyze Language.BIPL.Analysis.DeadCode.Sample.deadElse Language.BIPL.Analysis.DeadCode.Sample.deadElseStore
  print $ DeadCode.analyze Language.BIPL.Analysis.DeadCode.Sample.deadThen Language.BIPL.Analysis.DeadCode.Sample.deadThenStore
  print $ DeadCode.analyze Language.BIPL.Analysis.DeadCode.Sample.unknownBranch Language.BIPL.Analysis.DeadCode.Sample.unknownBranchStore
  print $ DeadCode.analyze Language.BIPL.Analysis.DeadCode.Sample.deadLoopBody Language.BIPL.Analysis.DeadCode.Sample.deadLoopBodyStore
  print $ DeadCode.analyze Language.BIPL.Analysis.DeadCode.Sample.nestedDeadBranch Language.BIPL.Analysis.DeadCode.Sample.nestedDeadBranchStore

main_slicing_analysis = do
  print $ Slicing.analyze Language.BIPL.Analysis.Slicing.Sample.straightLine Language.BIPL.Analysis.Slicing.Sample.straightLineStore
  print $ Slicing.analyze Language.BIPL.Analysis.Slicing.Sample.controlDependency Language.BIPL.Analysis.Slicing.Sample.controlDependencyStore
  print $ Slicing.analyze Language.BIPL.Analysis.Slicing.Sample.combinedDependency Language.BIPL.Analysis.Slicing.Sample.combinedDependencyStore
  print $ Slicing.analyze Language.BIPL.Analysis.Slicing.Sample.loopDependency Language.BIPL.Analysis.Slicing.Sample.loopDependencyStore
  print $ Slicing.analyze Language.BIPL.Analysis.Slicing.Sample.preSeededDependency Language.BIPL.Analysis.Slicing.Sample.preSeededDependencyStore

main_information_flow_analysis = do
  print $ InformationFlow.analyzeWithPublicSinks Language.BIPL.Analysis.InformationFlow.Sample.explicitLeak Language.BIPL.Analysis.InformationFlow.Sample.explicitLeakStore Language.BIPL.Analysis.InformationFlow.Sample.explicitLeakSinks
  print $ InformationFlow.analyzeWithPublicSinks Language.BIPL.Analysis.InformationFlow.Sample.implicitLeak Language.BIPL.Analysis.InformationFlow.Sample.implicitLeakStore Language.BIPL.Analysis.InformationFlow.Sample.implicitLeakSinks
  print $ InformationFlow.analyzeWithPublicSinks Language.BIPL.Analysis.InformationFlow.Sample.safePublicComputation Language.BIPL.Analysis.InformationFlow.Sample.safePublicComputationStore Language.BIPL.Analysis.InformationFlow.Sample.safePublicComputationSinks
  print $ InformationFlow.analyzeWithPublicSinks Language.BIPL.Analysis.InformationFlow.Sample.highIntermediate Language.BIPL.Analysis.InformationFlow.Sample.highIntermediateStore Language.BIPL.Analysis.InformationFlow.Sample.highIntermediateSinks
  print $ InformationFlow.analyzeWithPublicSinks Language.BIPL.Analysis.InformationFlow.Sample.loopLeak Language.BIPL.Analysis.InformationFlow.Sample.loopLeakStore Language.BIPL.Analysis.InformationFlow.Sample.loopLeakSinks
  print $ InformationFlow.analyzeWithPublicSinks Language.BIPL.Analysis.InformationFlow.Sample.privateComputation Language.BIPL.Analysis.InformationFlow.Sample.privateComputationStore Language.BIPL.Analysis.InformationFlow.Sample.privateComputationSinks

main_termination_analysis = do
  print $ Termination.finish $ Algebra.interpret Termination.algebra Language.BIPL.Analysis.Termination.Sample.decrementToZero Termination.initialState
  print $ Termination.finish $ Algebra.interpret Termination.algebra Language.BIPL.Analysis.Termination.Sample.incrementToLimit Termination.initialState
  print $ Termination.finish $ Algebra.interpret Termination.algebra Language.BIPL.Analysis.Termination.Sample.movesAwayFromBound Termination.initialState
  print $ Termination.finish $ Algebra.interpret Termination.algebra Language.BIPL.Analysis.Termination.Sample.guardVariableUnchanged Termination.initialState
  print $ Termination.finish $ Algebra.interpret Termination.algebra Language.BIPL.Analysis.Termination.Sample.unknownBooleanGuard Termination.initialState
  print $ Termination.finish $ Algebra.interpret Termination.algebra Language.BIPL.Analysis.Termination.Sample.unknownConditionalUpdate Termination.initialState

main_analysis = do
  main_type_state_analysis
  main_sign_analysis
  main_interval_analysis
  main_dead_code_analysis
  main_slicing_analysis
  main_information_flow_analysis
  main_termination_analysis

main = do
  main_interpretation
  main_typechecking
  main_analysis
