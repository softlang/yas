# File _languages/BML/Haskell/Language/BML/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BML/Haskell/Language/BML/Syntax.hs)**
```
-- BEGIN ...
module Language.BML.Syntax where
-- END ...
data Instr
  = Const Int -- Push a constant onto the stack
  | Store Int -- Store TOS in storage and pop TOS
  | Load Int -- Push a storage cell's content onto stack
...
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/BML/Haskell/Language/BML/Syntax.hs',haskell(text))
