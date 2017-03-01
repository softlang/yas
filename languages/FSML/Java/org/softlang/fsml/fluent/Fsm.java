// BEGIN ...
package org.softlang.fsml.fluent;
// END ...
public interface Fsm {
	public Fsm addState(String state);
	public Fsm addTransition(String event, String action, String target);
	public String getInitial();
	public ActionStatePair makeTransition(String state, String event);
}
