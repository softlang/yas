# File _languages/GBL/Java/org/softlang/gbl/Resolution.java_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/GBL/Java/org/softlang/gbl/Resolution.java)**
```
package org.softlang.gbl;
public class Resolution {
    public static Syntax.World resolve(org.softlang.tbl.Syntax.World tree) {
        Syntax.World graph = new Syntax.World();
        graph.persons = new Syntax.Person[tree.persons.length];
        for (int i=0; i<tree.persons.length; i++) {
            graph.persons[i] = new Syntax.Person();
...
```
