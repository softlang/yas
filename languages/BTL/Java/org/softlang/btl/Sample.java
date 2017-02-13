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
