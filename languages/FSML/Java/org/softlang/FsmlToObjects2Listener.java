// Generated from org/softlang/FsmlToObjects2.g4 by ANTLR 4.4
 package org.softlang; 
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link FsmlToObjects2Parser}.
 */
public interface FsmlToObjects2Listener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link FsmlToObjects2Parser#fsm}.
	 * @param ctx the parse tree
	 */
	void enterFsm(@NotNull FsmlToObjects2Parser.FsmContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#fsm}.
	 * @param ctx the parse tree
	 */
	void exitFsm(@NotNull FsmlToObjects2Parser.FsmContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjects2Parser#stateid}.
	 * @param ctx the parse tree
	 */
	void enterStateid(@NotNull FsmlToObjects2Parser.StateidContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#stateid}.
	 * @param ctx the parse tree
	 */
	void exitStateid(@NotNull FsmlToObjects2Parser.StateidContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjects2Parser#action}.
	 * @param ctx the parse tree
	 */
	void enterAction(@NotNull FsmlToObjects2Parser.ActionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#action}.
	 * @param ctx the parse tree
	 */
	void exitAction(@NotNull FsmlToObjects2Parser.ActionContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjects2Parser#state}.
	 * @param ctx the parse tree
	 */
	void enterState(@NotNull FsmlToObjects2Parser.StateContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#state}.
	 * @param ctx the parse tree
	 */
	void exitState(@NotNull FsmlToObjects2Parser.StateContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjects2Parser#event}.
	 * @param ctx the parse tree
	 */
	void enterEvent(@NotNull FsmlToObjects2Parser.EventContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#event}.
	 * @param ctx the parse tree
	 */
	void exitEvent(@NotNull FsmlToObjects2Parser.EventContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjects2Parser#transition}.
	 * @param ctx the parse tree
	 */
	void enterTransition(@NotNull FsmlToObjects2Parser.TransitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#transition}.
	 * @param ctx the parse tree
	 */
	void exitTransition(@NotNull FsmlToObjects2Parser.TransitionContext ctx);
}