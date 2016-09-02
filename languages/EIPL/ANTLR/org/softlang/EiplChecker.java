// BEGIN ...
package org.softlang;

import org.antlr.v4.runtime.ANTLRInputStream; 
import org.antlr.v4.runtime.CommonTokenStream; 
import java.io.FileInputStream;
import java.io.IOException;
// END ...
public class EiplChecker {
	public static void main(String[] args)
			throws IOException {
		EiplCheckerParser parser =
		  new EiplCheckerParser(
		    new CommonTokenStream(
		      new EiplCheckerLexer(
		        new ANTLRInputStream(
		          new FileInputStream(args[0])))));
		parser.program();
		System.exit((parser.getNumberOfSyntaxErrors() == 0
			     && parser.ok) ? 0 : 1);
	}
}
