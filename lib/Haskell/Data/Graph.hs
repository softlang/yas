-- BEGIN ...
module Data.Graph where
import Prelude hiding (lookup)
import Data.IORef
import Data.Map
-- END ...
-- Map list of terms to a list of refs
termsToRefs :: (a -> s -> IO (IORef b, s)) -> s -> [a] -> IO [IORef b]
termsToRefs f z ts = termsToRefs' z ts
  where
    termsToRefs' _ [] = return []
    termsToRefs' _ (t:ts) = do
      (r, z') <- f t z
      rs <- termsToRefs' z' ts
      return (r:rs)

-- Map key to ref, use map for house keeping
keyToRef :: Ord a => a -> Map a (IORef b) -> IO (IORef b, Map a (IORef b))
keyToRef k m =
  case lookup k m of
    Nothing -> do
      r <- newIORef undefined
      return (r, insert k r m)
    Just r -> return (r, m)
