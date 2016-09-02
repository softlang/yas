package org.softlang;

public class ImperativeSample {
	
	public static Fsm sample;
	
	static {
		// Construct FSM
		sample = new Fsm();
		
		// Declare all states
		State s;
		s = new State();
		s.setStateid("locked");
		s.setInitial(true);
		sample.getStates().add(s);
		s = new State();
		s.setStateid("unlocked");
		sample.getStates().add(s);
		s = new State();
		s.setStateid("exception");
		sample.getStates().add(s);	

		// Add all transitions
		Transition t;
		t = new Transition();
		t.setSource("locked");
		t.setEvent("ticket");
		t.setAction("collect");
		t.setTarget("unlocked");
		sample.getTransitions().add(t);
		t = new Transition();
		t.setSource("locked");
		t.setEvent("pass");
		t.setAction("alarm");
		t.setTarget("exception");
		sample.getTransitions().add(t);
		t = new Transition();
		t.setSource("unlocked");
		t.setEvent("ticket");
		t.setAction("eject");
		t.setTarget("unlocked");
		sample.getTransitions().add(t);
		t = new Transition();
		t.setSource("unlocked");
		t.setEvent("pass");
		t.setTarget("locked");
		sample.getTransitions().add(t);
		t = new Transition();
		t.setSource("exception");
		t.setEvent("ticket");
		t.setAction("eject");
		t.setTarget("exception");
		sample.getTransitions().add(t);
		t = new Transition();
		t.setSource("exception");
		t.setEvent("pass");
		t.setTarget("exception");
		sample.getTransitions().add(t);
		t = new Transition();
		t.setSource("exception");
		t.setEvent("mute");
		t.setTarget("exception");
		sample.getTransitions().add(t);
		t = new Transition();
		t.setSource("exception");
		t.setEvent("release");
		t.setTarget("locked");
		sample.getTransitions().add(t);	
	}	
}
