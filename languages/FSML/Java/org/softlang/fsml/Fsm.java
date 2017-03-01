// BEGIN ...
package org.softlang.fsml;
import java.util.*;
// END ...
public class Fsm {
	private List<State> states = new LinkedList<>();
	private List<Transition> transitions = new LinkedList<>();
	public List<State> getStates() { return states; }
	public List<Transition> getTransitions() { return transitions; }
}
