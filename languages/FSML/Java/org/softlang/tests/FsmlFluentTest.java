// BEGIN ...
package org.softlang.tests;

import org.softlang.FsmlSimulator;
import org.softlang.fluent.Sample;
import org.junit.Test;
import static org.junit.Assert.assertArrayEquals;
// END ...
public class FsmlFluentTest {
		
	private static final String[] input = 
		{"ticket", "ticket", "pass", "pass", "ticket", "mute", "release"};
	private static final String[] output = 
		{"collect", "eject", "alarm", "eject"};
	
	@Test
	public void runSample() {
		assertArrayEquals(output, new FsmlSimulator(Sample.sample).run(input));
	}
}
