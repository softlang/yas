-- BEGIN ...
{-# LANGUAGE TemplateHaskell #-}
module TypedPower where
import Language.Haskell.TH
-- END ...
power :: Int -> Q (TExp Int) -> Q (TExp Int)
power n x =
  if n==0
    then [|| 1 ||]
    else [|| $$x * $$(power (n-1) x) ||]

mk_power :: Int -> Q (TExp (Int -> Int))
mk_power n = [|| \x -> $$(power n [|| x ||]) ||]
