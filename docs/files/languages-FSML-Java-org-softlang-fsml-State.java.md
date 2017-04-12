# File _languages/FSML/Java/org/softlang/fsml/State.java_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Java/org/softlang/fsml/State.java)**
```
// BEGIN ...
package org.softlang.fsml;
// END ...
public class State {
	private String id;
	private boolean initial;
	public String getStateid() { return id; }
	public void setStateid(String state) { this.id = state; }
	public boolean isInitial() { return initial; }
	public void setInitial(boolean initial) { this.initial = initial; }
	public State() { }
	public State(String id) { this.id = id; }
	public State(String id, boolean initial) { this.id = id; this.initial = initial; }
}
```
