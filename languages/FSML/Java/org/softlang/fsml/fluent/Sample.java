// BEGIN ...
package org.softlang.fluent;

import static org.softlang.fluent.FsmlImpl.fsm;

public class Sample {
	
	public static final
// END ...
		Fsml sample =
			fsm()
				.state("locked")
					.transition("ticket", "collect", "unlocked")
					.transition("pass", "alarm", "exception")
				.state("unlocked")
					.transition("ticket", "eject", "unlocked")
					.transition("pass", null, "locked")
				.state("exception")
					.transition("ticket", "eject", "exception")
					.transition("pass", null, "exception")
					.transition("mute", null, "exception")
					.transition("release", null, "locked");
// BEGIN ...
}
// END ...
