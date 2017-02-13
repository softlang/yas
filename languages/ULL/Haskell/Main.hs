import Language.ULL.Syntax
import Language.ULL.Sample
import Language.ULL.SmallStep
import Language.ULL.Value
import Language.ULL.Closure
import Data.Map (empty)

main = do
  let r = steps (Apply (Apply add (fromInt 20)) (fromInt 22))
  print $ r
  print $ maybe undefined toInt r
