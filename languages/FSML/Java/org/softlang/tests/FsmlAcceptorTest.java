// BEGIN ...
package org.softlang.tests;

import org.softlang.FsmlLexer;
import org.softlang.FsmlParser;
import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CommonTokenStream;
import java.io.IOException;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class FsmlAcceptorTest {
// END ....
	public void tryParser(String filename) throws IOException {
		FsmlParser parser = new FsmlParser(
								new CommonTokenStream(
									new FsmlLexer(
										new ANTLRFileStream(filename))));
		parser.fsm();
		assertEquals(0, parser.getNumberOfSyntaxErrors());
	}
// BEGIN ...
	@Test
	public void parseSample() throws IOException {
		tryParser("../sample.fsml");
	}
}
// END ...