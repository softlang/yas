package org.softlang.influent;

public class State {
	private String state;
	private boolean initial;
	public String getState() { return state; }
	public void setState(String state) { this.state = state; }
	public boolean isInitial() { return initial; }
	public void setInitial(boolean initial) { this.initial = initial; }
	public State() { }
	// Functional constructors
	public State(String state) { this.state = state; }
	public State(String state, boolean initial) { this.state = state; this.initial = initial; }
}
