-- BEGIN ...
module Language.GBL.Sample where
import Data.IORef
import Language.GBL.Syntax
-- END ...
mkSmallWorld :: IO World
mkSmallWorld = do
  r1 <- newIORef Nothing
  r2 <- newIORef Nothing
  let p1 = Person { getName = "joe", getBuddy = r2 }
  let p2 = Person { getName = "bill", getBuddy = r1 }
  writeIORef r1 (Just p1)
  writeIORef r2 (Just p2)
  return $ World [p1, p2]
