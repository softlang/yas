// BEGIN ...
package org.softlang.fsml.fluent;

import static org.softlang.fsml.fluent.FsmImpl.fsm;

public class Sample {
	
	public static final
// END ...
		Fsm turnstile =
			fsm()
				.addState("locked")
					.addTransition("ticket", "collect", "unlocked")
					.addTransition("pass", "alarm", "exception")
				.addState("unlocked")
					.addTransition("ticket", "eject", "unlocked")
					.addTransition("pass", null, "locked")
				.addState("exception")
					.addTransition("ticket", "eject", "exception")
					.addTransition("pass", null, "exception")
					.addTransition("mute", null, "exception")
					.addTransition("release", null, "locked");
// BEGIN ...
}
// END ...
