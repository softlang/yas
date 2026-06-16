import Language.ULL.Syntax as ULL
import Language.TLL.Syntax as TLL
import Language.TLL.Sample
import Language.ULL.SmallStep
import Language.ULL.Value
import Language.ULL.Closure
import Language.TLL.Erasure
import Language.TLL.Typing
import Data.Map (empty)

main = do
  -- Type checking
  print $ typeOf empty add
  let sample = (ULL.Apply (ULL.Apply (erase add) (fromInt 20)) (fromInt 22))
  -- Evaluation via erasure+SOS path
  let r = steps sample
  print $ r
  print $ maybe undefined toInt r
