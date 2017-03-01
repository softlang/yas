// BEGIN ...
package org.softlang.btl;
// END ...
public class Syntax {
    public static abstract class Expr { }
    public static class True extends Expr { }
    public static class False extends Expr { }
    public static class Zero extends Expr { }
    public static class Succ extends Expr {
        public Expr e;
        public Succ(Expr e) { this.e = e; }
    }
    public static class Pred extends Expr {
        public Expr e;
        public Pred(Expr e) { this.e = e; }
    }
    public static class IsZero extends Expr {
        public Expr e;
        public IsZero(Expr e) { this.e = e; }
    }
    public static class If extends Expr {
        public Expr e0;
        public Expr e1;
        public Expr e2;
        public If(Expr e0, Expr e1, Expr e2) {
            this.e0 = e0; this.e1 = e1; this.e2 = e2;
        }
    }
}
