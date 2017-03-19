// Generated from BnlEbnf.g4 by ANTLR 4.4
package org.softlang.bnl;
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link BnlEbnfParser}.
 */
public interface BnlEbnfListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link BnlEbnfParser#number}.
	 * @param ctx the parse tree
	 */
	void enterNumber(@NotNull BnlEbnfParser.NumberContext ctx);
	/**
	 * Exit a parse tree produced by {@link BnlEbnfParser#number}.
	 * @param ctx the parse tree
	 */
	void exitNumber(@NotNull BnlEbnfParser.NumberContext ctx);
	/**
	 * Enter a parse tree produced by {@link BnlEbnfParser#bit}.
	 * @param ctx the parse tree
	 */
	void enterBit(@NotNull BnlEbnfParser.BitContext ctx);
	/**
	 * Exit a parse tree produced by {@link BnlEbnfParser#bit}.
	 * @param ctx the parse tree
	 */
	void exitBit(@NotNull BnlEbnfParser.BitContext ctx);
}