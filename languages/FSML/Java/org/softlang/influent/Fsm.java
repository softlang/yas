package org.softlang.influent;

import org.softlang.FsmlObservation;
import org.softlang.FsmlException;

import java.util.List;
import java.util.LinkedList;

public class Fsm implements FsmlObservation {
	private List<State> states = new LinkedList<State>();
	private List<Trans> transitions = new LinkedList<Trans>();
	public List<State> getStates() { return states; }
	public List<Trans> getTranss() { return transitions; }
	public String getInitial() {
		for (State s : states) 
			if (s.isInitial()) return s.getState();
		throw new FsmlException();
	}
	public String getAction(String state, String event) {
		for (Trans t : transitions)
			if (t.getSource().equals(state) && t.getEvent().equals(event))
				return t.getAction();
		throw new FsmlException();
	}
	public String getTarget(String state, String event) {
		for (Trans t : transitions)
			if (t.getSource().equals(state) && t.getEvent().equals(event))
				return t.getTarget();
		throw new FsmlException();
	}
}
