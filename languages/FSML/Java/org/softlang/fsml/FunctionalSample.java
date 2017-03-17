// BEGIN ...
package org.softlang.fsml;

public class FunctionalSample {
	
	public static Fsm turnstile;
	
	static {
// END ...
turnstile = new Fsm();
turnstile.getStates().add(new State("locked", true));
turnstile.getStates().add(new State("unlocked"));
turnstile.getStates().add(new State("exception"));
turnstile.getTransitions().add(new Transition("locked", "ticket", "collect", "unlocked"));
turnstile.getTransitions().add(new Transition("locked", "pass", "alarm", "exception"));
// ... // add more transitions
// BEGIN ...
		turnstile.getTransitions().add(new Transition("unlocked", "ticket", "eject", "unlocked"));
		turnstile.getTransitions().add(new Transition("unlocked", "pass", null, "locked"));
		turnstile.getTransitions().add(new Transition("exception", "ticket", "eject", "exception"));
		turnstile.getTransitions().add(new Transition("exception", "pass", null, "exception"));
		turnstile.getTransitions().add(new Transition("exception", "mute", null, "exception"));
		turnstile.getTransitions().add(new Transition("exception", "release", null, "locked"));
	}	
}
// END ...
