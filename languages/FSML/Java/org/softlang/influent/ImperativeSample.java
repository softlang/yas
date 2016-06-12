package org.softlang.influent;

public class ImperativeSample {
	
	public static Fsm sample;
	
	static {
		// Construct FSM
		sample = new Fsm();
		
		// Declare all states
		State s;
		s = new State();
		s.setState("locked");
		s.setInitial(true);
		sample.getStates().add(s);
		s = new State();
		s.setState("unlocked");
		sample.getStates().add(s);
		s = new State();
		s.setState("exception");
		sample.getStates().add(s);	

		// Add all transitions
		Trans t;
		t = new Trans();
		t.setSource("locked");
		t.setEvent("ticket");
		t.setAction("collect");
		t.setTarget("unlocked");
		sample.getTranss().add(t);
		t = new Trans();
		t.setSource("locked");
		t.setEvent("pass");
		t.setAction("alarm");
		t.setTarget("exception");
		sample.getTranss().add(t);
		t = new Trans();
		t.setSource("unlocked");
		t.setEvent("ticket");
		t.setAction("eject");
		t.setTarget("unlocked");
		sample.getTranss().add(t);
		t = new Trans();
		t.setSource("unlocked");
		t.setEvent("pass");
		t.setTarget("locked");
		sample.getTranss().add(t);
		t = new Trans();
		t.setSource("exception");
		t.setEvent("ticket");
		t.setAction("eject");
		t.setTarget("exception");
		sample.getTranss().add(t);
		t = new Trans();
		t.setSource("exception");
		t.setEvent("pass");
		t.setTarget("exception");
		sample.getTranss().add(t);
		t = new Trans();
		t.setSource("exception");
		t.setEvent("mute");
		t.setTarget("exception");
		sample.getTranss().add(t);
		t = new Trans();
		t.setSource("exception");
		t.setEvent("release");
		t.setTarget("locked");
		sample.getTranss().add(t);	
	}	
}
