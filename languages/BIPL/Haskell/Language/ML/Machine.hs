-- BEGIN ...
module Language.ML.Machine (run) where
import Language.ML.Syntax
import Data.Map
-- END ...
type Store = Map Int Int
type Stack = [Int]

-- run :: [Instr] -> (Store, Stack)
run zs0 = run' zs0 empty []
  where
    run' [] sto sta = (sto, sta)
    run' (z:zs) sto sta = run' zs' sto' sta'
      where
        (sto', sta', zs') = step z
        step (Const i) = (sto, i : sta, zs) 
        step (Store i) = (insert i (head sta) sto, tail sta, zs) 
        step (Load i) = (sto, sto!i : sta, zs) 
        step (Jump i) = (sto, sta, drop i zs0)
        step (CJump i) =
          if head sta /= 0
            then (sto, tail sta, drop i zs0)
            else (sto, tail sta, zs)
        step Not = (sto, not' (head sta) : tail sta, zs) 
        step Add = (sto, bop (+) sta, zs)
        -- ...
-- BEGIN ...
        step Sub = (sto, bop (-) sta, zs)
        step Mul = (sto, bop (*) sta, zs)
        step Lt = (sto, bop' (<) sta, zs)
        step Leq = (sto, bop' (<=) sta, zs)
        step Eq = (sto, bop' (==) sta, zs)
        step Geq = (sto, bop' (>=) sta, zs)
        step Gt = (sto, bop' (>) sta, zs)
        step And = (sto, bop and' sta, zs)
        step Or = (sto, bop or' sta, zs)
-- END ...

-- Negation on ints
not' :: Int -> Int
not' i = if i == 0 then 1 else 0

-- BEGIN ...
-- Conjunction and disjunction on ints
and', or' :: Int -> Int -> Int
and' i1 i2 = signum (abs i1) * signum (abs i2)
or' i1 i2 = signum (abs i1 + abs i2)
-- END ...
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
