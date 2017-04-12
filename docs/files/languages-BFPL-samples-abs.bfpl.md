# File _languages/BFPL/samples/abs.bfpl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/samples/abs.bfpl)**
```
abs :: Int -> Int
abs x = if (<) x 0 then - x else x

-- Apply the function
main = print $ abs (-42) -- Prints 42
```
