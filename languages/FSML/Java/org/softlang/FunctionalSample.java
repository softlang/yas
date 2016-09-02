package org.softlang;

public class FunctionalSample {
	
	public static Fsm sample;
	
	static {
		// Construct FSM
		sample = new Fsm();
		
		// Declare all states
		sample.getStates().add(new State("locked", true));
		sample.getStates().add(new State("unlocked"));
		sample.getStates().add(new State("exception"));
		
		// Add all transitions
		sample.getTransitions().add(new Transition("locked", "ticket", "collect", "unlocked"));
		sample.getTransitions().add(new Transition("locked", "pass", "alarm", "exception"));
		sample.getTransitions().add(new Transition("unlocked", "ticket", "eject", "unlocked"));
		sample.getTransitions().add(new Transition("unlocked", "pass", null, "locked"));
		sample.getTransitions().add(new Transition("exception", "ticket", "eject", "exception"));
		sample.getTransitions().add(new Transition("exception", "pass", null, "exception"));
		sample.getTransitions().add(new Transition("exception", "mute", null, "exception"));
		sample.getTransitions().add(new Transition("exception", "release", null, "locked"));
	}	
}
