# File _languages/FSML/Java/org/softlang/fsml/Fsm.java_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Java/org/softlang/fsml/Fsm.java)**
```
// BEGIN ...
package org.softlang.fsml;
import java.util.*;
// END ...
public class Fsm {
	private List<State> states = new LinkedList<>();
	private List<Transition> transitions = new LinkedList<>();
	public List<State> getStates() { return states; }
	public List<Transition> getTransitions() { return transitions; }
}
```

## Languages
* [Java](../languages/Java.md)

## References
* elementOf('languages/FSML/Java/org/softlang/fsml/Fsm.java',java(text))
