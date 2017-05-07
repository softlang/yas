-- BEGIN ...
module Language.GBL.Resolution where
import Prelude hiding (lookup)
import Language.TBL.Syntax as TBL
import Language.GBL.Syntax as GBL
import Data.IORef
import Data.Map (Map, empty, lookup, insert)
import Data.Graph
-- END ...
-- Helper types for resolution
type PersonRef = IORef GBL.Person
type PersonMap = Map String PersonRef

-- Map tree- to graph-based world
resolve :: TBL.World -> IO GBL.World
resolve (TBL.World ps) = do  
    rs <- termsToRefs personToRef empty ps
    return (GBL.World rs)
  where
    -- Store person as IORef
    personToRef :: TBL.Person -> PersonMap -> IO (PersonRef, PersonMap)
    personToRef p m = do
      let n = TBL.getName p
      let b = TBL.getBuddy p
      (r, m') <- keyToRef n m
      (b', m'') <- (case b of
        Nothing -> return (Nothing, m')
        (Just n') -> do
          (r', m'') <- keyToRef n' m'
          return (Just r', m''))        
      writeIORef r (
        GBL.Person {
          GBL.getName = n,
          GBL.getBuddy = b' } )
      return (r, m'')
