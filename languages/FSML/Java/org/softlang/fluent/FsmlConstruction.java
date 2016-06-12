package org.softlang.fluent;

public interface FsmlConstruction {
	public Fsml state(String state);
	public Fsml transition(String event, String action, String target);
}
