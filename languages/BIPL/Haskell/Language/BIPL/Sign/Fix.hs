-- BEGIN ...
-- Computation and comparison of increasing iterands
module Language.BIPL.Sign.Fix where

-- END ...
fix' :: Eq a => ((a -> a) -> a -> a) -> (a -> a) -> a -> a
fix' h i x = limit (iterate h i)
  where
    limit (b1:b2:bs) = if b1 x == b2 x then b1 x else limit (b2:bs)
