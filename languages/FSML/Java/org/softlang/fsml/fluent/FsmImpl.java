// BEGIN ...
package org.softlang.fsml.fluent;
import org.softlang.fsml.*;
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
	public Fsm addState(String id) {
		// First state is initial state
		if (initial == null) initial = id;
		// Remember state for subsequent transitions
		this.current = id;
		if (fsm.containsKey(id))	throw new FsmlDistinctIdsException();
		fsm.put(id, new HashMap<String, ActionStatePair>());
		return this;
	}
	// Add transition for current state
	public Fsm addTransition(String event, String action, String target) {
		if (fsm.get(current).containsKey(event)) throw new FsmlDeterministismException();
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
		if (!fsm.containsKey(state)) throw new FsmlResolutionException();
		if (!fsm.get(state).containsKey(event)) throw new FsmlInfeasibleEventException();
		return fsm.get(state).get(event);
	}
}
