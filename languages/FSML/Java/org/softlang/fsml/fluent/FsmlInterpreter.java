// BEGIN ...
package org.softlang.fsml.fluent;
import java.util.ArrayList;
// END ...
public class FsmlInterpreter {
	public static String[] run(Fsm fsm, String[] input) {
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
