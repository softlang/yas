import Language.BTL.Syntax
import qualified Language.BTL.Sample as S1
import qualified Language.BTL.Universal.Sample as S2
import qualified Language.BTL.Universal.Term
import Language.BTL.Interpreter as AdHoc
import Language.BTL.BigStep as BigStep1
import Language.BTL.BigStepWithGuards as BigStep2
import Language.BTL.SmallStep
import Language.BTL.Typing
import Language.BTL.Closure
import Data.Term

main = do
  print $ S1.sample
  print $ S2.sample
  print $ explode S1.sample == S2.sample
  print $ implode S2.sample == S1.sample
  print $ wellTyped S1.sample
  print $ AdHoc.evaluate S1.sample
  print $ BigStep1.evaluate S1.sample
  print $ BigStep2.evaluate S1.sample
  print $ steps S1.sample
