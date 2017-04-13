# File _languages/FSML/Java/org/softlang/fsml/FsmlObservation.java_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Java/org/softlang/fsml/FsmlObservation.java)**
```
// BEGIN ...
package org.softlang.fsml;

import org.softlang.fsml.fluent.ActionStatePair;

// END ...
public interface FsmlObservation {
	String getInitial();
	public ActionStatePair makeTransition(String state, String event);
}
```

## Languages
* [Java](../languages/Java.md) (java(text))

## References
* elementOf('languages/FSML/Java/org/softlang/fsml/FsmlObservation.java',java(text))
