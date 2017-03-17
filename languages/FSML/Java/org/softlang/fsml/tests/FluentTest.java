// BEGIN ...
package org.softlang.fsml.tests;
import org.softlang.fsml.fluent.Sample;
import static org.softlang.fsml.fluent.FsmlInterpreter.run;
import org.junit.Test;
import static org.junit.Assert.assertArrayEquals;
// END ...
public class FluentTest {
		
	private static final String[] input = 
		{"ticket", "ticket", "pass", "pass", "ticket", "mute", "release"};
	private static final String[] output = 
		{"collect", "eject", "alarm", "eject"};
	
	@Test
	public void runSample() {
		assertArrayEquals(output, run(Sample.turnstile, input));
	}
}
