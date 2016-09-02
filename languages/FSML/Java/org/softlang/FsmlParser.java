// Generated from org/softlang/Fsml.g4 by ANTLR 4.4
 package org.softlang; 
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class FsmlParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.4", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__6=1, T__5=2, T__4=3, T__3=4, T__2=5, T__1=6, T__0=7, NAME=8, WS=9;
	public static final String[] tokenNames = {
		"<INVALID>", "'/'", "'->'", "'state'", "'initial'", "';'", "'{'", "'}'", 
		"NAME", "WS"
	};
	public static final int
		RULE_fsm = 0, RULE_state = 1, RULE_transition = 2, RULE_stateid = 3, RULE_event = 4, 
		RULE_action = 5;
	public static final String[] ruleNames = {
		"fsm", "state", "transition", "stateid", "event", "action"
	};

	@Override
	public String getGrammarFileName() { return "Fsml.g4"; }

	@Override
	public String[] getTokenNames() { return tokenNames; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public FsmlParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class FsmContext extends ParserRuleContext {
		public StateContext state(int i) {
			return getRuleContext(StateContext.class,i);
		}
		public TerminalNode EOF() { return getToken(FsmlParser.EOF, 0); }
		public List<StateContext> state() {
			return getRuleContexts(StateContext.class);
		}
		public FsmContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_fsm; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).enterFsm(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).exitFsm(this);
		}
	}

	public final FsmContext fsm() throws RecognitionException {
		FsmContext _localctx = new FsmContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_fsm);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(15);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__4 || _la==T__3) {
				{
				{
				setState(12); state();
				}
				}
				setState(17);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(18); match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StateContext extends ParserRuleContext {
		public StateidContext stateid() {
			return getRuleContext(StateidContext.class,0);
		}
		public List<TransitionContext> transition() {
			return getRuleContexts(TransitionContext.class);
		}
		public TransitionContext transition(int i) {
			return getRuleContext(TransitionContext.class,i);
		}
		public StateContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_state; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).enterState(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).exitState(this);
		}
	}

	public final StateContext state() throws RecognitionException {
		StateContext _localctx = new StateContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_state);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(21);
			_la = _input.LA(1);
			if (_la==T__3) {
				{
				setState(20); match(T__3);
				}
			}

			setState(23); match(T__4);
			setState(24); stateid();
			setState(25); match(T__1);
			setState(29);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==NAME) {
				{
				{
				setState(26); transition();
				}
				}
				setState(31);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(32); match(T__0);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TransitionContext extends ParserRuleContext {
		public StateidContext target;
		public ActionContext action() {
			return getRuleContext(ActionContext.class,0);
		}
		public StateidContext stateid() {
			return getRuleContext(StateidContext.class,0);
		}
		public EventContext event() {
			return getRuleContext(EventContext.class,0);
		}
		public TransitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_transition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).enterTransition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).exitTransition(this);
		}
	}

	public final TransitionContext transition() throws RecognitionException {
		TransitionContext _localctx = new TransitionContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_transition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(34); event();
			setState(37);
			_la = _input.LA(1);
			if (_la==T__6) {
				{
				setState(35); match(T__6);
				setState(36); action();
				}
			}

			setState(41);
			_la = _input.LA(1);
			if (_la==T__5) {
				{
				setState(39); match(T__5);
				setState(40); ((TransitionContext)_localctx).target = stateid();
				}
			}

			setState(43); match(T__2);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StateidContext extends ParserRuleContext {
		public TerminalNode NAME() { return getToken(FsmlParser.NAME, 0); }
		public StateidContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_stateid; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).enterStateid(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).exitStateid(this);
		}
	}

	public final StateidContext stateid() throws RecognitionException {
		StateidContext _localctx = new StateidContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_stateid);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(45); match(NAME);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class EventContext extends ParserRuleContext {
		public TerminalNode NAME() { return getToken(FsmlParser.NAME, 0); }
		public EventContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_event; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).enterEvent(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).exitEvent(this);
		}
	}

	public final EventContext event() throws RecognitionException {
		EventContext _localctx = new EventContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_event);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(47); match(NAME);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ActionContext extends ParserRuleContext {
		public TerminalNode NAME() { return getToken(FsmlParser.NAME, 0); }
		public ActionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_action; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).enterAction(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlListener ) ((FsmlListener)listener).exitAction(this);
		}
	}

	public final ActionContext action() throws RecognitionException {
		ActionContext _localctx = new ActionContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_action);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(49); match(NAME);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\3\13\66\4\2\t\2\4\3"+
		"\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\3\2\7\2\20\n\2\f\2\16\2\23\13\2\3"+
		"\2\3\2\3\3\5\3\30\n\3\3\3\3\3\3\3\3\3\7\3\36\n\3\f\3\16\3!\13\3\3\3\3"+
		"\3\3\4\3\4\3\4\5\4(\n\4\3\4\3\4\5\4,\n\4\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3"+
		"\7\3\7\2\2\b\2\4\6\b\n\f\2\2\64\2\21\3\2\2\2\4\27\3\2\2\2\6$\3\2\2\2\b"+
		"/\3\2\2\2\n\61\3\2\2\2\f\63\3\2\2\2\16\20\5\4\3\2\17\16\3\2\2\2\20\23"+
		"\3\2\2\2\21\17\3\2\2\2\21\22\3\2\2\2\22\24\3\2\2\2\23\21\3\2\2\2\24\25"+
		"\7\2\2\3\25\3\3\2\2\2\26\30\7\6\2\2\27\26\3\2\2\2\27\30\3\2\2\2\30\31"+
		"\3\2\2\2\31\32\7\5\2\2\32\33\5\b\5\2\33\37\7\b\2\2\34\36\5\6\4\2\35\34"+
		"\3\2\2\2\36!\3\2\2\2\37\35\3\2\2\2\37 \3\2\2\2 \"\3\2\2\2!\37\3\2\2\2"+
		"\"#\7\t\2\2#\5\3\2\2\2$\'\5\n\6\2%&\7\3\2\2&(\5\f\7\2\'%\3\2\2\2\'(\3"+
		"\2\2\2(+\3\2\2\2)*\7\4\2\2*,\5\b\5\2+)\3\2\2\2+,\3\2\2\2,-\3\2\2\2-.\7"+
		"\7\2\2.\7\3\2\2\2/\60\7\n\2\2\60\t\3\2\2\2\61\62\7\n\2\2\62\13\3\2\2\2"+
		"\63\64\7\n\2\2\64\r\3\2\2\2\7\21\27\37\'+";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}