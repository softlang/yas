import Language.BTL.Syntax
import Language.BTL.Sample
import Language.BTL.Interpreter as AdHoc
import Language.BTL.BigStep as BigStep1
import Language.BTL.BigStepWithGuards as BigStep2
import Language.BTL.SmallStep
import Language.BTL.Typing
import Language.BTL.Closure

main = do
  print $ sample
  print $ wellTyped sample
  print $ AdHoc.evaluate sample
  print $ BigStep1.evaluate sample
  print $ BigStep2.evaluate sample
  print $ steps sample
