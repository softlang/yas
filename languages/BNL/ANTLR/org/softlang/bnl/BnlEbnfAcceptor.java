package org.softlang.bnl;

import org.antlr.v4.runtime.*;
import java.io.IOException;

public class BnlEbnfAcceptor {
	public static void main(String[] args) throws IOException {
		BnlEbnfParser parser =
		  new BnlEbnfParser(
		    new CommonTokenStream(
		      new BnlEbnfLexer(
		        new ANTLRFileStream(args[0]))));
		parser.number();
		System.exit(parser.getNumberOfSyntaxErrors());
	}
}
