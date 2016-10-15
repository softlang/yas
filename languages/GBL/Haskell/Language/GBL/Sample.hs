-- BEGIN ...
module Language.GBL.Sample where
import Data.IORef
import Language.GBL.Syntax
-- END ...
mkSmallWorld :: IO World
mkSmallWorld = do
  r1 <- newIORef undefined
  r2 <- newIORef undefined
  writeIORef r1 Person { getName = "joe", getBuddy = Just r2 }
  writeIORef r2 Person { getName = "bill", getBuddy = Just r1 }
  return $ World [r1, r2]
