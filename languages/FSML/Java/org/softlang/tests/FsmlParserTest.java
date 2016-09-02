package org.softlang.tests;

import java.io.FileInputStream;
import java.io.IOException;

import org.softlang.FsmlToObjectsLexer;
import org.softlang.FsmlToObjectsParser;
import org.softlang.Fsm;
import org.softlang.FsmlSimulator;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertArrayEquals;

public class FsmlParserTest {
		
	private static final String[] input = 
		{"ticket", "ticket", "pass", "pass", "ticket", "mute", "release"};
	private static final String[] output = 
		{"collect", "eject", "alarm", "eject"};
	
	@Test
	public void runSample() throws IOException {
		FsmlToObjectsParser parser =
				  new FsmlToObjectsParser(
				    new CommonTokenStream(
				      new FsmlToObjectsLexer(
				        new ANTLRInputStream(
				          new FileInputStream("../sample.fsml")))));
		parser.fsm();
		Fsm sample = parser.fsm;
		assertEquals(0, parser.getNumberOfSyntaxErrors());
		assertArrayEquals(output, new FsmlSimulator(sample).run(input));
	}
}
