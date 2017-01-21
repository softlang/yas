import Language.GBL.Syntax
import qualified Language.TBL.Sample as TBL
import Language.GBL.Sample
import Data.IORef
import qualified Language.GBL.V2.Syntax
import qualified Language.GBL.V2.Sample
import Language.GBL.Resolution

lookupFirstBuddy :: World -> IO ()
lookupFirstBuddy w = do
  let (World (r1:_)) = w
  p1 <- readIORef r1
  print $ getName p1
  let (Just r2) = getBuddy p1
  p2 <- readIORef r2
  print $ getName p2

main = do
  w1 <- mkSmallWorld
  lookupFirstBuddy w1
  w2 <- resolve TBL.smallWorld
  lookupFirstBuddy w1
