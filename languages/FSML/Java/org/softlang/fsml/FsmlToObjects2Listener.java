// Generated from FsmlToObjects2.g4 by ANTLR 4.5.3
package org.softlang.fsml;
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
	void enterFsm(FsmlToObjects2Parser.FsmContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#fsm}.
	 * @param ctx the parse tree
	 */
	void exitFsm(FsmlToObjects2Parser.FsmContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjects2Parser#state}.
	 * @param ctx the parse tree
	 */
	void enterState(FsmlToObjects2Parser.StateContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#state}.
	 * @param ctx the parse tree
	 */
	void exitState(FsmlToObjects2Parser.StateContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjects2Parser#transition}.
	 * @param ctx the parse tree
	 */
	void enterTransition(FsmlToObjects2Parser.TransitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#transition}.
	 * @param ctx the parse tree
	 */
	void exitTransition(FsmlToObjects2Parser.TransitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjects2Parser#stateid}.
	 * @param ctx the parse tree
	 */
	void enterStateid(FsmlToObjects2Parser.StateidContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#stateid}.
	 * @param ctx the parse tree
	 */
	void exitStateid(FsmlToObjects2Parser.StateidContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjects2Parser#event}.
	 * @param ctx the parse tree
	 */
	void enterEvent(FsmlToObjects2Parser.EventContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#event}.
	 * @param ctx the parse tree
	 */
	void exitEvent(FsmlToObjects2Parser.EventContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjects2Parser#action}.
	 * @param ctx the parse tree
	 */
	void enterAction(FsmlToObjects2Parser.ActionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjects2Parser#action}.
	 * @param ctx the parse tree
	 */
	void exitAction(FsmlToObjects2Parser.ActionContext ctx);
}