package org.softlang.fsml.tests;

import org.junit.Test;
import org.softlang.fsml.FsmlObservationImpl;
import org.softlang.fsml.FsmlSimulator;
import org.softlang.fsml.FunctionalSample;
import org.softlang.fsml.ImperativeSample;

import static org.junit.Assert.assertArrayEquals;

public class InfluentTest {
		
	private static final String[] input =
		{"ticket", "ticket", "pass", "pass", "ticket", "mute", "release"};
	private static final String[] output = 
		{"collect", "eject", "alarm", "eject"};
	
	@Test
	public void runImperativeSample() {
		assertArrayEquals(output, new FsmlSimulator(new FsmlObservationImpl(ImperativeSample.turnstile)).run(input));
	}
	
	@Test
	public void runFunctionalSample() {
		assertArrayEquals(output, new FsmlSimulator(new FsmlObservationImpl(FunctionalSample.turnstile)).run(input));
	}	
}
