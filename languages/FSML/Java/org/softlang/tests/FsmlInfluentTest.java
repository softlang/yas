package org.softlang.tests;

import org.junit.Test;
import org.softlang.FsmlSimulator;
import org.softlang.influent.FunctionalSample;
import org.softlang.influent.ImperativeSample;

import static org.junit.Assert.assertArrayEquals;

public class FsmlInfluentTest {
		
	private static final String[] input =
		{"ticket", "ticket", "pass", "pass", "ticket", "mute", "release"};
	private static final String[] output = 
		{"collect", "eject", "alarm", "eject"};
	
	@Test
	public void runImperativeSample() {
		assertArrayEquals(output, new FsmlSimulator(ImperativeSample.sample).run(input));
	}
	
	@Test
	public void runFunctionalSample() {
		assertArrayEquals(output, new FsmlSimulator(FunctionalSample.sample).run(input));
	}	
}
