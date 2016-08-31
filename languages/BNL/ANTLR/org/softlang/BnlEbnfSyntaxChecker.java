// BEGIN ...
package org.softlang;

import org.antlr.v4.runtime.ANTLRInputStream; 
import org.antlr.v4.runtime.CommonTokenStream; 
import java.io.FileInputStream;
import java.io.IOException;
// END ...
public class BnlEbnfSyntaxChecker {
	public static void main(String[] args)
			throws IOException {
		BnlEbnfParser parser =
		  new BnlEbnfParser(
		    new CommonTokenStream(
		      new BnlEbnfLexer(
		        new ANTLRInputStream(
		          new FileInputStream(args[0])))));
		parser.number();
		System.exit(
		  parser.getNumberOfSyntaxErrors() == Integer.parseInt(args[1]) ? 0 : 1);
	}
}
