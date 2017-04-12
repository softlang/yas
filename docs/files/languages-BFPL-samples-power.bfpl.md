# File _languages/BFPL/samples/power.bfpl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/samples/power.bfpl)**
```
power :: Int -> Int -> Int
power n x =
  if (==) n 0
    then 1
    else (*) x (power ((-) n 1) x)

main = print $ power 3 2 -- Prints 8
```
