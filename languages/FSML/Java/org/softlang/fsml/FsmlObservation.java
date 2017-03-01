// BEGIN ...
package org.softlang.fsml;

import org.softlang.fsml.fluent.ActionStatePair;

// END ...
public interface FsmlObservation {
	String getInitial();
	public ActionStatePair makeTransition(String state, String event);
}
