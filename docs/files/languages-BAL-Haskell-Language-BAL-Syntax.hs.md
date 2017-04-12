# File _languages/BAL/Haskell/Language/BAL/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BAL/Haskell/Language/BAL/Syntax.hs)**
```
-- BEGIN ...
module Language.BAL.Syntax where
-- END ...
data Instr
  = Const Int -- Push a constant onto the stack
  | Store String -- Store TOS in storage and pop TOS
  | Load String -- Push a storage cell's content onto stack
...
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/BAL/Haskell/Language/BAL/Syntax.hs',haskell(text))
