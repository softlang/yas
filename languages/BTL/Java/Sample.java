// BEGIN ...
package org.softlang.btl;
import org.softlang.btl.Syntax.*;
// END ...
public class Sample {
    public Expr getSample() {
       return
            new Pred(
                new If(
                    new IsZero(new Zero()),
                    new Succ(new Succ(new Zero())),
                    new Zero()));
    }
}
