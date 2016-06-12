import Language.FSML.Syntax
import Language.FSML.Sample
import Language.FSML.SampleIO
import Language.FSML.Interpreter

main = do
  let as = simulate sampleFsm sampleInput 
  print $ as
  print $ as == sampleOutput

