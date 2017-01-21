-- BEGIN ...
module Language.BAL.Assembler where
import qualified Language.BAL.Syntax as BAL
import qualified Language.BML.Syntax as BML
import Data.List (nub, findIndex)
import Data.Maybe (fromJust)
-- END ...
assemble :: [BAL.Instr] -> [BML.Instr]
assemble zs = concat (map f zs)
  where
    f (BAL.Const i) = [BML.Const i]
    f (BAL.Store x) = [BML.Store (cell x)]
    f (BAL.Load x) = [BML.Load (cell x)]
    f (BAL.Label x) = []
    f (BAL.Jump x) = [BML.Jump (instruction x)]
    f (BAL.CJump x) = [BML.CJump (instruction x)]
    f BAL.Not = [BML.Not]
    f BAL.Add = [BML.Add]
    -- ...
-- BEGIN ...
    f BAL.Sub = [BML.Sub]
    f BAL.Mul = [BML.Mul]
    f BAL.Lt = [BML.Lt]
    f BAL.Leq = [BML.Leq]
    f BAL.Eq = [BML.Eq]
    f BAL.Geq = [BML.Geq]
    f BAL.Gt = [BML.Gt]
    f BAL.And = [BML.And]
    f BAL.Or = [BML.Or]
-- END ...

    -- Map symbol to memory cell
    cell :: String -> Int
    cell x = fromJust (findIndex (==x) symbols)
      where
        symbols = nub (concat (map symbol zs))
        symbol (BAL.Store x) = [x]
        symbol _ = []

    -- Map label to instruction address
    instruction :: String -> Int
    instruction x = instruction' 0 zs
      where
        instruction' i (BAL.Label x' : zs) = if x==x' then i else instruction' i zs
        instruction' i (_ : zs) = instruction' (i+1) zs
