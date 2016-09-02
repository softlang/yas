// Generated from org/softlang/EiplChecker.g4 by ANTLR 4.4

package org.softlang;

import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link EiplCheckerParser}.
 */
public interface EiplCheckerListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link EiplCheckerParser#decl}.
	 * @param ctx the parse tree
	 */
	void enterDecl(@NotNull EiplCheckerParser.DeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link EiplCheckerParser#decl}.
	 * @param ctx the parse tree
	 */
	void exitDecl(@NotNull EiplCheckerParser.DeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link EiplCheckerParser#scope}.
	 * @param ctx the parse tree
	 */
	void enterScope(@NotNull EiplCheckerParser.ScopeContext ctx);
	/**
	 * Exit a parse tree produced by {@link EiplCheckerParser#scope}.
	 * @param ctx the parse tree
	 */
	void exitScope(@NotNull EiplCheckerParser.ScopeContext ctx);
	/**
	 * Enter a parse tree produced by {@link EiplCheckerParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(@NotNull EiplCheckerParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link EiplCheckerParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(@NotNull EiplCheckerParser.ExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link EiplCheckerParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(@NotNull EiplCheckerParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link EiplCheckerParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(@NotNull EiplCheckerParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link EiplCheckerParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterStmt(@NotNull EiplCheckerParser.StmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link EiplCheckerParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitStmt(@NotNull EiplCheckerParser.StmtContext ctx);
}