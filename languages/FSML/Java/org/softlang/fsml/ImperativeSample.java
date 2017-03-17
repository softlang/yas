// BEGIN ...
package org.softlang.fsml;

public class ImperativeSample {
	
	public static Fsm turnstile;
	
	static {
// END ...
turnstile = new Fsm();		
State s = new State();
s.setStateid("locked");
s.setInitial(true);
turnstile.getStates().add(s);
s = new State();
s.setStateid("unlocked");
turnstile.getStates().add(s);
s = new State();
s.setStateid("exception");
turnstile.getStates().add(s);	
Transition t = new Transition();
t.setSource("locked");
t.setEvent("ticket");
t.setAction("collect");
t.setTarget("unlocked");
turnstile.getTransitions().add(t);
t = new Transition();
// ... // add more transitions
// BEGIN ...
		t.setSource("locked");
		t.setEvent("pass");
		t.setAction("alarm");
		t.setTarget("exception");
		turnstile.getTransitions().add(t);
		t = new Transition();
		t.setSource("unlocked");
		t.setEvent("ticket");
		t.setAction("eject");
		t.setTarget("unlocked");
		turnstile.getTransitions().add(t);
		t = new Transition();
		t.setSource("unlocked");
		t.setEvent("pass");
		t.setTarget("locked");
		turnstile.getTransitions().add(t);
		t = new Transition();
		t.setSource("exception");
		t.setEvent("ticket");
		t.setAction("eject");
		t.setTarget("exception");
		turnstile.getTransitions().add(t);
		t = new Transition();
		t.setSource("exception");
		t.setEvent("pass");
		t.setTarget("exception");
		turnstile.getTransitions().add(t);
		t = new Transition();
		t.setSource("exception");
		t.setEvent("mute");
		t.setTarget("exception");
		turnstile.getTransitions().add(t);
		t = new Transition();
		t.setSource("exception");
		t.setEvent("release");
		t.setTarget("locked");
		turnstile.getTransitions().add(t);	
		ImperativeSample.turnstile = turnstile;
	}	
}
//END ...
