import Language.GBL.Syntax
import Language.GBL.Sample
import Data.IORef
import qualified Language.GBL.V2.Syntax
import qualified Language.GBL.V2.Sample

main = do
  w <- mkSmallWorld
  let [bill] = [ p | p <- getPersons w, getName p == "bill" ]
  Just b <- readIORef (getBuddy bill)
  print $ getName b
