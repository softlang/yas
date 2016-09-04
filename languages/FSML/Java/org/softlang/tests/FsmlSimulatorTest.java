package org.softlang.tests;

import java.io.IOException;

import org.softlang.FsmlToObjectsLexer;
import org.softlang.FsmlToObjectsParser;
import org.softlang.Fsm;
import org.softlang.FsmlSimulator;
import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertArrayEquals;

public class FsmlSimulatorTest {
		
	private static final String[] input = 
		{"ticket", "ticket", "pass", "pass", "ticket", "mute", "release"};
	private static final String[] output = 
		{"collect", "eject", "alarm", "eject"};

	public Fsm textToObjects(String filename) throws IOException {
		FsmlToObjectsParser parser =
				  new FsmlToObjectsParser(
				    new CommonTokenStream(
				      new FsmlToObjectsLexer(
						new ANTLRFileStream(filename))));
		parser.fsm();
		Fsm fsm = parser.fsm;
		assertEquals(0, parser.getNumberOfSyntaxErrors());
		return fsm;
	}
	
	@Test
	public void runSample() throws IOException {
		Fsm sample = textToObjects("../sample.fsml");
		assertArrayEquals(output, new FsmlSimulator(sample).run(input));
	}
}
