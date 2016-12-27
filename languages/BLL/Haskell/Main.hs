import Language.BLL.Syntax
import Language.BLL.Sample
import Language.BLL.SmallStep
import Language.BLL.Nf
import Language.BLL.Closure
import Language.BLL.Typing
import Data.Map (empty)

main = do
  let r = steps (Apply (Apply add (fromInt 20)) (fromInt 22))
  print $ typeOf empty add
  print $ r
  print $ maybe undefined toInt r
