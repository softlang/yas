-- BEGIN ...
module Language.AL.Assembler where
import qualified Language.AL.Syntax as AL
import qualified Language.ML.Syntax as ML
import Data.List (nub, findIndex)
import Data.Maybe (fromJust)
-- END ...
assemble :: [AL.Instr] -> [ML.Instr]
assemble zs = concat (map f zs)
  where
    f (AL.Const i) = [ML.Const i]
    f (AL.Store x) = [ML.Store (address x)]
    f (AL.Load x) = [ML.Load (address x)]
    f (AL.Label x) = []
    f (AL.Jump x) = [ML.Jump (counter x)]
    f (AL.CJump x) = [ML.CJump (counter x)]
    f AL.Not = [ML.Not]
    f AL.Add = [ML.Add]
    -- ...
-- BEGIN ...
    f AL.Sub = [ML.Sub]
    f AL.Mul = [ML.Mul]
    f AL.Lt = [ML.Lt]
    f AL.Leq = [ML.Leq]
    f AL.Eq = [ML.Eq]
    f AL.Geq = [ML.Geq]
    f AL.Gt = [ML.Gt]
    f AL.And = [ML.And]
    f AL.Or = [ML.Or]
-- END ...

    -- Map register to memory address
    address :: String -> Int
    address x = fromJust (findIndex (==x) symbols)
      where
        symbols = nub (concat (map symbol zs))
        symbol (AL.Store x) = [x]
        symbol _ = []

    -- Map label to instruction counter
    counter :: String -> Int
    counter x = counter' 0 zs
      where
        counter' i (AL.Label x' : zs) =
          if x==x' then i else counter' i zs
        counter' i (_ : zs) = counter' (i+1) zs
