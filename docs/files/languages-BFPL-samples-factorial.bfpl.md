# File _languages/BFPL/samples/factorial.bfpl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/samples/factorial.bfpl)**
```
-- The factorial function
factorial :: Int -> Int
factorial x =
  if ((==) x 0)
    then 1
    else ((*) x (factorial ((-) x 1)))

-- Apply the function to 5
main = print $ factorial 5 -- Prints 120
```

## Languages
* [BFPL](../languages/BFPL.md) (bfpl(text))

## References
* elementOf('languages/BFPL/samples/factorial.bfpl',bfpl(text))
* mapsTo(parse,['languages/BFPL/samples/factorial.bfpl'],['languages/BFPL/samples/factorial.term'])
