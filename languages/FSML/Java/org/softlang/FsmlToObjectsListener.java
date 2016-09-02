// Generated from org/softlang/FsmlToObjects.g4 by ANTLR 4.4
 package org.softlang; 
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link FsmlToObjectsParser}.
 */
public interface FsmlToObjectsListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link FsmlToObjectsParser#fsm}.
	 * @param ctx the parse tree
	 */
	void enterFsm(@NotNull FsmlToObjectsParser.FsmContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#fsm}.
	 * @param ctx the parse tree
	 */
	void exitFsm(@NotNull FsmlToObjectsParser.FsmContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjectsParser#stateid}.
	 * @param ctx the parse tree
	 */
	void enterStateid(@NotNull FsmlToObjectsParser.StateidContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#stateid}.
	 * @param ctx the parse tree
	 */
	void exitStateid(@NotNull FsmlToObjectsParser.StateidContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjectsParser#action}.
	 * @param ctx the parse tree
	 */
	void enterAction(@NotNull FsmlToObjectsParser.ActionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#action}.
	 * @param ctx the parse tree
	 */
	void exitAction(@NotNull FsmlToObjectsParser.ActionContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjectsParser#state}.
	 * @param ctx the parse tree
	 */
	void enterState(@NotNull FsmlToObjectsParser.StateContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#state}.
	 * @param ctx the parse tree
	 */
	void exitState(@NotNull FsmlToObjectsParser.StateContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjectsParser#event}.
	 * @param ctx the parse tree
	 */
	void enterEvent(@NotNull FsmlToObjectsParser.EventContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#event}.
	 * @param ctx the parse tree
	 */
	void exitEvent(@NotNull FsmlToObjectsParser.EventContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjectsParser#transition}.
	 * @param ctx the parse tree
	 */
	void enterTransition(@NotNull FsmlToObjectsParser.TransitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#transition}.
	 * @param ctx the parse tree
	 */
	void exitTransition(@NotNull FsmlToObjectsParser.TransitionContext ctx);
}