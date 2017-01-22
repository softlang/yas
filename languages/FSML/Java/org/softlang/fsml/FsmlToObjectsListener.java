// Generated from FsmlToObjects.g4 by ANTLR 4.5.3
package org.softlang.fsml;
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
	void enterFsm(FsmlToObjectsParser.FsmContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#fsm}.
	 * @param ctx the parse tree
	 */
	void exitFsm(FsmlToObjectsParser.FsmContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjectsParser#state}.
	 * @param ctx the parse tree
	 */
	void enterState(FsmlToObjectsParser.StateContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#state}.
	 * @param ctx the parse tree
	 */
	void exitState(FsmlToObjectsParser.StateContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjectsParser#transition}.
	 * @param ctx the parse tree
	 */
	void enterTransition(FsmlToObjectsParser.TransitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#transition}.
	 * @param ctx the parse tree
	 */
	void exitTransition(FsmlToObjectsParser.TransitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjectsParser#stateid}.
	 * @param ctx the parse tree
	 */
	void enterStateid(FsmlToObjectsParser.StateidContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#stateid}.
	 * @param ctx the parse tree
	 */
	void exitStateid(FsmlToObjectsParser.StateidContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjectsParser#event}.
	 * @param ctx the parse tree
	 */
	void enterEvent(FsmlToObjectsParser.EventContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#event}.
	 * @param ctx the parse tree
	 */
	void exitEvent(FsmlToObjectsParser.EventContext ctx);
	/**
	 * Enter a parse tree produced by {@link FsmlToObjectsParser#action}.
	 * @param ctx the parse tree
	 */
	void enterAction(FsmlToObjectsParser.ActionContext ctx);
	/**
	 * Exit a parse tree produced by {@link FsmlToObjectsParser#action}.
	 * @param ctx the parse tree
	 */
	void exitAction(FsmlToObjectsParser.ActionContext ctx);
}