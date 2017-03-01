// BEGIN ...
package org.softlang.fsml.fluent;
import org.softlang.fsml.FsmlException;
import java.util.HashMap;
// END ...
public class FsmImpl implements Fsm {
	private String initial; // the initial state
	private String current; // the "current" state
	// A cascaded map for maintaining states and transitions
	private HashMap<String, HashMap<String, ActionStatePair>> fsm =
			new HashMap<>();
	private FsmImpl() { }
	// Construct FSM object
	public static Fsm fsm() { return new FsmImpl(); }
	// Add state and set it as current state
	public Fsm addState(String state) {
		// First state is initial state
		if (initial == null) initial = state;
		// Remember state for subsequent transitions
		this.current = state;
		if (fsm.containsKey(state))	throw new FsmlException();
		fsm.put(state, new HashMap<String, ActionStatePair>());
		return this;
	}
	// Add transition for current state
	public Fsm addTransition(String event, String action, String target) {
		if (fsm.get(current).containsKey(event)) throw new FsmlException();
		ActionStatePair pair = new ActionStatePair();
		pair.action = action;
		pair.state = target;
		fsm.get(current).put(event, pair);
		return this;
	}
	// Getter for initial state
	public String getInitial() { 
		return initial; 
	}
	// Make transition
	public ActionStatePair makeTransition(String state, String event) {
		return fsm.get(state).get(event);
	}
}
