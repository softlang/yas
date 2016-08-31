// BEGIN ...
package org.softlang;

import org.antlr.v4.runtime.ANTLRInputStream; 
import org.antlr.v4.runtime.CommonTokenStream; 
import java.io.FileInputStream;
import java.io.IOException;
// END ...
public class BnlBnfSyntaxChecker {
	public static void main(String[] args)
			throws IOException {
		BnlBnfParser parser =
		  new BnlBnfParser(
		    new CommonTokenStream(
		      new BnlBnfLexer(
		        new ANTLRInputStream(
		          new FileInputStream(args[0])))));
		parser.number();
		System.exit(
		  parser.getNumberOfSyntaxErrors() == Integer.parseInt(args[1]) ? 0 : 1);
	}
}
