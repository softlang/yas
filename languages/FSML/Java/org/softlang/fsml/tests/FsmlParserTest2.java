// BEGIN ...
package org.softlang.fsml.tests;

import org.softlang.fsml.*;
import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CommonTokenStream;
import java.io.IOException;
import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertArrayEquals;

public class FsmlParserTest2 {
		
	private static final String[] input = 
		{"ticket", "ticket", "pass", "pass", "ticket", "mute", "release"};
	private static final String[] output = 
		{"collect", "eject", "alarm", "eject"};

	public Fsm textToObjects(String filename) throws IOException {
		FsmlToObjects2Parser parser =
				  new FsmlToObjects2Parser(
				    new CommonTokenStream(
				      new FsmlToObjects2Lexer(
						new ANTLRFileStream(filename))));
// END ...
		Fsm fsm = parser.fsm().result;
// BEGIN ...
		assertEquals(0, parser.getNumberOfSyntaxErrors());
		return fsm;
	}
	
	@Test
	public void runSample() throws IOException {
		Fsm sample = textToObjects("../sample.fsml");
		assertArrayEquals(output, new FsmlInterpreter(new FsmlObservationImpl(sample)).run(input));
	}
}
// END ...
