// Generated from Fsml.g4 by ANTLR 4.5.3
package org.softlang.fsml;
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
	void enterFsm(FsmlParser.FsmContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#fsm}.
	 * @param ctx the parse tree
	 */
	void exitFsm(FsmlParser.FsmContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlParser#state}.
	 * @param ctx the parse tree
	 */
	void enterState(FsmlParser.StateContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#state}.
	 * @param ctx the parse tree
	 */
	void exitState(FsmlParser.StateContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlParser#transition}.
	 * @param ctx the parse tree
	 */
	void enterTransition(FsmlParser.TransitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#transition}.
	 * @param ctx the parse tree
	 */
	void exitTransition(FsmlParser.TransitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlParser#stateid}.
	 * @param ctx the parse tree
	 */
	void enterStateid(FsmlParser.StateidContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#stateid}.
	 * @param ctx the parse tree
	 */
	void exitStateid(FsmlParser.StateidContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlParser#event}.
	 * @param ctx the parse tree
	 */
	void enterEvent(FsmlParser.EventContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#event}.
	 * @param ctx the parse tree
	 */
	void exitEvent(FsmlParser.EventContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlParser#action}.
	 * @param ctx the parse tree
	 */
	void enterAction(FsmlParser.ActionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlParser#action}.
	 * @param ctx the parse tree
	 */
	void exitAction(FsmlParser.ActionContext ctx);
}