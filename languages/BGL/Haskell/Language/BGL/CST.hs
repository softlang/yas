-- BEGIN ...
module Language.BGL.CST where
import Language.BGL.Syntax
import Data.Tree
-- END ...
type Info = Either Char Rule
type CST = Tree Info
