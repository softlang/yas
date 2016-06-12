// BEGIN ...
package org.softlang;

import org.antlr.v4.runtime.ANTLRInputStream; 
import org.antlr.v4.runtime.CommonTokenStream; 
import java.io.FileInputStream;
import java.io.IOException;
// END ...
public class FsmlSyntaxChecker {
	public static void main(String[] args)
			throws IOException {
		FsmlParser parser =
		  new FsmlParser(
		    new CommonTokenStream(
		      new FsmlLexer(
		        new ANTLRInputStream(
		          new FileInputStream(args[0])))));
		parser.fsm();
		System.exit(
		  parser.getNumberOfSyntaxErrors() == Integer.parseInt(args[1]) ? 0 : 1);
	}
}
