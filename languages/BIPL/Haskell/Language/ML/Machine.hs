-- BEGIN ...
module Language.ML.Machine (run) where
import Language.ML.Syntax
import Data.Map
-- END ...
type Store = Map Int Int
type Stack = [Int]

run :: [Instr] -> (Store, Stack)
run zs0 = run' zs0 empty []
  where
    run' :: [Instr] -> Store -> Stack -> (Store, Stack)
    run' [] sto sta = (sto, sta)
    run' (z:zs) sto sta =
        let (zs', sto', sta') = step z
         in run' zs' sto' sta'
      where
        step :: Instr -> ([Instr], Store, Stack)
        step (Const i) = (zs, sto, i : sta) 
        step (Store i) = (zs, insert i (head sta) sto, tail sta) 
        step (Load i) = (zs, sto, sto!i : sta) 
        step (Jump i) = (drop i zs0, sto, sta)
        step (CJump i) =
          if head sta /= 0
            then (drop i zs0, sto, tail sta)
            else (zs, sto, tail sta)
        step Not = (zs, sto, uop (\i -> if i == 0 then 1 else 0) sta) 
        step Add = (zs, sto, bop (+) sta)
        -- ...
-- BEGIN ...
        step Sub = (zs, sto, bop (-) sta)
        step Mul = (zs, sto, bop (*) sta)
        step Lt = (zs, sto, bop' (<) sta)
        step Leq = (zs, sto, bop' (<=) sta)
        step Eq = (zs, sto, bop' (==) sta)
        step Geq = (zs, sto, bop' (>=) sta)
        step Gt = (zs, sto, bop' (>) sta)
        step And = (zs, sto, bop and' sta)
        step Or = (zs, sto, bop or' sta)
        
-- Conjunction and disjunction on ints
and', or' :: Int -> Int -> Int
and' i1 i2 = signum (abs i1) * signum (abs i2)
or' i1 i2 = signum (abs i1 + abs i2)
-- END ...
-- Apply unary operation on ints on stack
uop :: (Int -> Int) -> Stack -> Stack
uop f (i1:sta) = f i1 : sta

-- Apply binary operation on ints on stack
bop :: (Int -> Int -> Int) -> Stack -> Stack
bop f (i2:i1:sta) = f i1 i2 : sta
-- BEGIN ...
-- Variation that turns Boolean result into int
bop' :: (Int -> Int -> Bool) -> Stack -> Stack
bop' f = bop (\i1 i2 -> toInt (f i1 i2))

-- C-like Booleans
toInt :: Bool -> Int
toInt False = 0
toInt True = 1
-- END ...
