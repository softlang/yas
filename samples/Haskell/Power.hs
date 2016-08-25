power :: Int -> Int -> Int
power n x =
  if n==0
    then 1
    else x * power (n-1) x
