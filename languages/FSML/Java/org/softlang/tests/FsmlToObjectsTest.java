package org.softlang.tests;

import java.io.IOException;
import org.softlang.FsmlLexer;
import org.softlang.FsmlParser;
import org.softlang.FsmlToObjects;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class FsmlToObjectsTest {
		
	@Test
	public void textToObjects() throws IOException {
		FsmlParser parser =
				  new FsmlParser(
				    new CommonTokenStream(
				      new FsmlLexer(
				        new ANTLRFileStream("../sample.fsml"))));
		ParseTree tree = parser.fsm();
		assertEquals(0, parser.getNumberOfSyntaxErrors());
		FsmlToObjects listener = new FsmlToObjects();
	    ParseTreeWalker walker = new ParseTreeWalker();
		walker.walk(listener, tree);
	}
}
