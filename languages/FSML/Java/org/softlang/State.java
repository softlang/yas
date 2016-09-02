package org.softlang;

public class State {
	private String stateid;
	private boolean initial;
	public String getStateid() { return stateid; }
	public void setStateid(String state) { this.stateid = state; }
	public boolean isInitial() { return initial; }
	public void setInitial(boolean initial) { this.initial = initial; }
	public State() { }
	// Functional constructors
	public State(String stateid) { this.stateid = stateid; }
	public State(String stateid, boolean initial) { this.stateid = stateid; this.initial = initial; }
}
