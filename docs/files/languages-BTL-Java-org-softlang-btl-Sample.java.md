# File _languages/BTL/Java/org/softlang/btl/Sample.java_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/Java/org/softlang/btl/Sample.java)**
```
// BEGIN ...
package org.softlang.btl;
import org.softlang.btl.Syntax.*;
public class Sample {
// END ...
    static final Expr sample =
      new Pred(
        new If(
          new IsZero(new Zero()),
          new Succ(new Succ(new Zero())),
          new Zero()));
// BEGIN ...
}
// END ...
```

## Languages
* [Java](../languages/Java.md) (java(text))

## References
* elementOf('languages/BTL/Java/org/softlang/btl/Sample.java',java(text))
