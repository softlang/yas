// BEGIN ...
package org.softlang.gbl;
import org.softlang.gbl.Syntax.*;
// END ...
public class Sample {
    public World smallWorld() {
        World w = new World();
        Person p1 = new Person();
        Person p2 = new Person();
        p1.name = "joe";
        p1.buddy = p2;
        p2.name = "bill";
        p2.buddy = p1;
        return w;
    }
}
