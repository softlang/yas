// Generated from BnlBnf.g4 by ANTLR 4.4
package org.softlang.bnl;
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link BnlBnfParser}.
 */
public interface BnlBnfListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link BnlBnfParser#number}.
	 * @param ctx the parse tree
	 */
	void enterNumber(@NotNull BnlBnfParser.NumberContext ctx);
	/**
	 * Exit a parse tree produced by {@link BnlBnfParser#number}.
	 * @param ctx the parse tree
	 */
	void exitNumber(@NotNull BnlBnfParser.NumberContext ctx);
	/**
	 * Enter a parse tree produced by {@link BnlBnfParser#rest}.
	 * @param ctx the parse tree
	 */
	void enterRest(@NotNull BnlBnfParser.RestContext ctx);
	/**
	 * Exit a parse tree produced by {@link BnlBnfParser#rest}.
	 * @param ctx the parse tree
	 */
	void exitRest(@NotNull BnlBnfParser.RestContext ctx);
	/**
	 * Enter a parse tree produced by {@link BnlBnfParser#bits}.
	 * @param ctx the parse tree
	 */
	void enterBits(@NotNull BnlBnfParser.BitsContext ctx);
	/**
	 * Exit a parse tree produced by {@link BnlBnfParser#bits}.
	 * @param ctx the parse tree
	 */
	void exitBits(@NotNull BnlBnfParser.BitsContext ctx);
	/**
	 * Enter a parse tree produced by {@link BnlBnfParser#bit}.
	 * @param ctx the parse tree
	 */
	void enterBit(@NotNull BnlBnfParser.BitContext ctx);
	/**
	 * Exit a parse tree produced by {@link BnlBnfParser#bit}.
	 * @param ctx the parse tree
	 */
	void exitBit(@NotNull BnlBnfParser.BitContext ctx);
}