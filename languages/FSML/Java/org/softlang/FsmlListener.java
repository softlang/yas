// Generated from org/softlang/Fsml.g4 by ANTLR 4.4

	// Injection of package and import into generated code
	package org.softlang;
	import org.softlang.influent.*;

import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link FsmlParser}.
 */
public interface FsmlListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link FsmlParser#fsm}.
	 * @param ctx the parse tree
	 */
	void enterFsm(@NotNull FsmlParser.FsmContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#fsm}.
	 * @param ctx the parse tree
	 */
	void exitFsm(@NotNull FsmlParser.FsmContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlParser#stateid}.
	 * @param ctx the parse tree
	 */
	void enterStateid(@NotNull FsmlParser.StateidContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#stateid}.
	 * @param ctx the parse tree
	 */
	void exitStateid(@NotNull FsmlParser.StateidContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlParser#statedecl}.
	 * @param ctx the parse tree
	 */
	void enterStatedecl(@NotNull FsmlParser.StatedeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#statedecl}.
	 * @param ctx the parse tree
	 */
	void exitStatedecl(@NotNull FsmlParser.StatedeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlParser#action}.
	 * @param ctx the parse tree
	 */
	void enterAction(@NotNull FsmlParser.ActionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#action}.
	 * @param ctx the parse tree
	 */
	void exitAction(@NotNull FsmlParser.ActionContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlParser#event}.
	 * @param ctx the parse tree
	 */
	void enterEvent(@NotNull FsmlParser.EventContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#event}.
	 * @param ctx the parse tree
	 */
	void exitEvent(@NotNull FsmlParser.EventContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlParser#transition}.
	 * @param ctx the parse tree
	 */
	void enterTransition(@NotNull FsmlParser.TransitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#transition}.
	 * @param ctx the parse tree
	 */
	void exitTransition(@NotNull FsmlParser.TransitionContext ctx);
}