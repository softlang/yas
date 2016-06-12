// BEGIN ...
package org.softlang.fluent;

import org.softlang.FsmlException;
import java.util.HashMap;
// END ...
public class FsmlImpl implements Fsml {
	// Helper struct for transitions
	private class Edge {
		private String action;
		private String target;
	}
	private String initial; // the initial state
	private String state; // the "current" state
	// A cascaded map for maintaining states and transitions
	private HashMap<String, HashMap<String, Edge>> fsm =
			new HashMap<String, HashMap<String, Edge>>();
	private FsmlImpl() { }
	// Construct FSM
	public static Fsml fsm() { return new FsmlImpl(); }
	// Add state
	public Fsml state(String state) {
		// First state is initial state
		if (initial == null) initial = state;
		// Remember state for subsequent transitions
		this.state = state;
		if (fsm.containsKey(state))	throw new FsmlException();
		fsm.put(state, new HashMap<String, Edge>());
		return this;
	}
	// Add transition
	public Fsml transition(String event, String action, String target) {
		if (fsm.get(state).containsKey(event)) throw new FsmlException();
		Edge edge = new Edge();
		edge.action = action;
		edge.target = target;
		fsm.get(state).put(event, edge);
		return this;
	}
	// Getter for initial
	public String getInitial() { 
		return initial; 
	}
	// Getter for action part of transition
	public String getAction(String state, String event) {
		return fsm.get(state).get(event).action;
	}
	// Getter for target-state part of transition
	public String getTarget(String state, String event) {
		return fsm.get(state).get(event).target;
	}	
}
