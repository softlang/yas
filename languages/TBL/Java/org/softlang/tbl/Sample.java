// BEGIN ...
package org.softlang.tbl;
import org.softlang.tbl.Syntax.*;
// END ...
public class Sample {
    public World smallWorld() {
	World w = new World();
        Person p1 = new Person();
	Person p2 = new Person();
	w.persons = new Person[] {p1, p2};
        p1.name = "joe";
        p1.buddy = "bill";
        p2.name = "bill";
        p2.buddy = "joe";
        return w;
    }
}
