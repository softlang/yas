// BEGIN ...
package org.softlang.fsml;

import java.util.ArrayList;

import org.softlang.fsml.fluent.ActionStatePair;
// END ...
public class FsmlInterpreter {
	private FsmlObservation fsm;
	public FsmlInterpreter(FsmlObservation fsm) { this.fsm = fsm; }
	public String[] run(String[] input) {
		ArrayList<String> output = new ArrayList<>();
		String state = fsm.getInitial();
		for (String event : input) {
			ActionStatePair pair = fsm.makeTransition(state, event);
			if (pair.action != null) output.add(pair.action);
			state = pair.state;
		}
		return output.toArray(new String[output.size()]);
	}
}
