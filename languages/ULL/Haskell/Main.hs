import Language.ULL.Syntax
import Language.ULL.Sample
import Language.ULL.SmallStep
import Language.ULL.Value
import Language.ULL.Closure
import Language.ULL.DS.Interpreter
import Data.Map (empty)

main = do
  let sample = (Apply (Apply add (fromInt 20)) (fromInt 22))
  -- Small-step operational semantics
  let r1 = steps sample
  print $ r1
  print $ maybe undefined toInt r1
  -- Denotational semantics
  let r2 = evaluateClosed sample
  print $ r2
