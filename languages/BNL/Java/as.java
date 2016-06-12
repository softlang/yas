public class Number {
    public Bits bits;
    public Rest rest;
}
public abstract class Bits { }
public class Single extends Bits {
    public Bit bit;
}
public class Many extends Bits {
    public Bit bit;
    public Bits bits;
}
public abstract class Bit { }
public class Zero extends Bit { }
public class One extends Bit { }
public abstract class Rest { }
public class Integer extends Rest { }
public class Rational extends Rest {
    Bits bits
}
