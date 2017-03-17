// BEGIN ...
package org.softlang.fsml;

import org.softlang.fsml.fluent.ActionStatePair;

// END ...
public class FsmlObservationImpl implements FsmlObservation {
	private Fsm fsm;
	public FsmlObservationImpl(Fsm fsm) { this.fsm = fsm; }
	public String getInitial() {
		for (State s : fsm.getStates()) 
			if (s.isInitial()) return s.getStateid();
		throw new FsmlSingleInitialException();
	}
	public ActionStatePair makeTransition(String state, String event) {
		for (Transition t : fsm.getTransitions())
			if (t.getSource().equals(state) && t.getEvent().equals(event)) {
				ActionStatePair pair = new ActionStatePair();
				pair.action = t.getAction();
				pair.state = t.getTarget();
				return pair;
			}
		throw new FsmlInfeasibleEventException();
	}
}
