package org.softlang.fsml;

import java.util.List;
import java.util.LinkedList;

public class Fsm implements FsmlObservation {
	private LinkedList<State> states = new LinkedList<>();
	private List<Transition> transitions = new LinkedList<>();
	public LinkedList<State> getStates() { return states; }
	public List<Transition> getTransitions() { return transitions; }
	public String getInitial() {
		for (State s : states) 
			if (s.isInitial()) return s.getStateid();
		throw new FsmlException();
	}
	public String getAction(String state, String event) {
		for (Transition t : transitions)
			if (t.getSource().equals(state) && t.getEvent().equals(event))
				return t.getAction();
		throw new FsmlException();
	}
	public String getTarget(String state, String event) {
		for (Transition t : transitions)
			if (t.getSource().equals(state) && t.getEvent().equals(event))
				return t.getTarget();
		throw new FsmlException();
	}
}
