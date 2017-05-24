package org.softlang.fsml.tests;

import org.softlang.fsml.FsmlToObjectsLexer;
import org.softlang.fsml.FsmlToObjectsParser;
import org.softlang.fsml.Fsm;
import org.softlang.fsml.FsmlObservationImpl;
import org.softlang.fsml.FsmlInterpreter;
import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CommonTokenStream;
import java.io.IOException;
import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertArrayEquals;

public class FsmlParserTest {
		
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
		assertArrayEquals(output, new FsmlInterpreter(new FsmlObservationImpl(sample)).run(input));
	}
}
