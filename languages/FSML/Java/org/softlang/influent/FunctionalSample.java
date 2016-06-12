package org.softlang.influent;

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
		sample.getTranss().add(new Trans("locked", "ticket", "collect", "unlocked"));
		sample.getTranss().add(new Trans("locked", "pass", "alarm", "exception"));
		sample.getTranss().add(new Trans("unlocked", "ticket", "eject", "unlocked"));
		sample.getTranss().add(new Trans("unlocked", "pass", null, "locked"));
		sample.getTranss().add(new Trans("exception", "ticket", "eject", "exception"));
		sample.getTranss().add(new Trans("exception", "pass", null, "exception"));
		sample.getTranss().add(new Trans("exception", "mute", null, "exception"));
		sample.getTranss().add(new Trans("exception", "release", null, "locked"));
	}	
}
