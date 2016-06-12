package org.softlang;

public interface FsmlObservation {
	String getInitial(); // Initial state
	public String getAction(String state, String event); // Action part of transition
	public String getTarget(String state, String event);  // Target-state part
}
