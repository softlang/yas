// BEGIN ...
package org.softlang;

import org.antlr.v4.runtime.ANTLRInputStream; 
import org.antlr.v4.runtime.CommonTokenStream; 
import java.io.FileInputStream;
import java.io.IOException;
// END ...
public class BnlBnfConversion {
	public static void main(String[] args)
			throws IOException {
		BnlBnfConversionParser parser =
		  new BnlBnfConversionParser(
		    new CommonTokenStream(
		      new BnlBnfConversionLexer(
		        new ANTLRInputStream(
		          new FileInputStream(args[0])))));
		Float val = parser.number().val;
		System.exit(
			    (parser.getNumberOfSyntaxErrors() == 0 &&
			     val == Float.parseFloat(args[1])) ? 0 : 1);
	}
}
