import Language.TULL.Syntax
import Language.TULL.Sample
import Language.TULL.SmallStep
import Language.TULL.Value
import Language.TULL.Closure
import Data.Map (empty)

main = do
  let r = steps (Apply (Apply add (fromInt 20)) (fromInt 22))
  print $ r
  print $ maybe undefined toInt r
