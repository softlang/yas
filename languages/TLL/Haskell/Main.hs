import Language.ULL.Syntax as ULL
import Language.TLL.Syntax as TLL
import Language.TLL.Sample
import Language.ULL.SmallStep
import Language.ULL.Nf
import Language.ULL.Closure
import Language.TLL.Erasure
import Language.TLL.Typing
import Data.Map (empty)

main = do
  let r = steps (ULL.Apply (ULL.Apply (erase add) (fromInt 20)) (fromInt 22))
  print $ typeOf empty add
  print $ r
  print $ maybe undefined toInt r
