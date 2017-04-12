# File _samples/Haskell/Power.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/Haskell/Power.hs)**
```
power :: Int -> Int -> Int
power n x =
  if n==0
    then 1
    else x * power (n-1) x
```
