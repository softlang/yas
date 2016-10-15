-- BEGIN ...
module Language.GBL.Syntax where
import Data.IORef
-- END ...
newtype World = World {
  getPersons :: [IORef Person] }
data Person = Person {
  getName :: String,
  getBuddy :: Maybe (IORef Person) }
