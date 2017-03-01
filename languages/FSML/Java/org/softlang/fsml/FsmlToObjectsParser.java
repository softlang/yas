// Generated from FsmlToObjects.g4 by ANTLR 4.5.3
package org.softlang.fsml;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class FsmlToObjectsParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.5.3", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, NAME=8, WS=9;
	public static final int
		RULE_fsm = 0, RULE_state = 1, RULE_transition = 2, RULE_stateid = 3, RULE_event = 4, 
		RULE_action = 5;
	public static final String[] ruleNames = {
		"fsm", "state", "transition", "stateid", "event", "action"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'initial'", "'state'", "'{'", "'}'", "'/'", "'->'", "';'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, null, null, null, null, null, null, null, "NAME", "WS"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "FsmlToObjects.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public Fsm fsm = new Fsm();
	public FsmlToObjectsParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class FsmContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(FsmlToObjectsParser.EOF, 0); }
		public List<StateContext> state() {
			return getRuleContexts(StateContext.class);
		}
		public StateContext state(int i) {
			return getRuleContext(StateContext.class,i);
		}
		public FsmContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_fsm; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).enterFsm(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).exitFsm(this);
		}
	}

	public final FsmContext fsm() throws RecognitionException {
		FsmContext _localctx = new FsmContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_fsm);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(13); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(12);
				state();
				}
				}
				setState(15); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==T__0 || _la==T__1 );
			setState(17);
			match(EOF);
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
		public StateidContext stateid;
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
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).enterState(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).exitState(this);
		}
	}

	public final StateContext state() throws RecognitionException {
		StateContext _localctx = new StateContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_state);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			boolean initial = false;
			setState(22);
			_la = _input.LA(1);
			if (_la==T__0) {
				{
				setState(20);
				match(T__0);
				initial = true;
				}
			}

			setState(24);
			match(T__1);
			setState(25);
			((StateContext)_localctx).stateid = stateid();
			fsm.getStates().add(new State((((StateContext)_localctx).stateid!=null?_input.getText(((StateContext)_localctx).stateid.start,((StateContext)_localctx).stateid.stop):null), initial));
			setState(27);
			match(T__2);
			setState(31);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==NAME) {
				{
				{
				setState(28);
				transition();
				}
				}
				setState(33);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(34);
			match(T__3);
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
		public EventContext event;
		public ActionContext action;
		public StateidContext stateid;
		public EventContext event() {
			return getRuleContext(EventContext.class,0);
		}
		public ActionContext action() {
			return getRuleContext(ActionContext.class,0);
		}
		public StateidContext stateid() {
			return getRuleContext(StateidContext.class,0);
		}
		public TransitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_transition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).enterTransition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).exitTransition(this);
		}
	}

	public final TransitionContext transition() throws RecognitionException {
		TransitionContext _localctx = new TransitionContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_transition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			String source = fsm.getStates().get(fsm.getStates().size()-1).getStateid();
			setState(37);
			((TransitionContext)_localctx).event = event();
			String action = null;
			setState(43);
			_la = _input.LA(1);
			if (_la==T__4) {
				{
				setState(39);
				match(T__4);
				setState(40);
				((TransitionContext)_localctx).action = action();
				action = (((TransitionContext)_localctx).action!=null?_input.getText(((TransitionContext)_localctx).action.start,((TransitionContext)_localctx).action.stop):null);
				}
			}

			String target = source;
			setState(50);
			_la = _input.LA(1);
			if (_la==T__5) {
				{
				setState(46);
				match(T__5);
				setState(47);
				((TransitionContext)_localctx).stateid = stateid();
				target = (((TransitionContext)_localctx).stateid!=null?_input.getText(((TransitionContext)_localctx).stateid.start,((TransitionContext)_localctx).stateid.stop):null);
				}
			}

			fsm.getTransitions().add(new Transition(source, (((TransitionContext)_localctx).event!=null?_input.getText(((TransitionContext)_localctx).event.start,((TransitionContext)_localctx).event.stop):null), action, target));
			setState(53);
			match(T__6);
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
		public TerminalNode NAME() { return getToken(FsmlToObjectsParser.NAME, 0); }
		public StateidContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_stateid; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).enterStateid(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).exitStateid(this);
		}
	}

	public final StateidContext stateid() throws RecognitionException {
		StateidContext _localctx = new StateidContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_stateid);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(55);
			match(NAME);
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
		public TerminalNode NAME() { return getToken(FsmlToObjectsParser.NAME, 0); }
		public EventContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_event; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).enterEvent(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).exitEvent(this);
		}
	}

	public final EventContext event() throws RecognitionException {
		EventContext _localctx = new EventContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_event);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(57);
			match(NAME);
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
		public TerminalNode NAME() { return getToken(FsmlToObjectsParser.NAME, 0); }
		public ActionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_action; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).enterAction(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof FsmlToObjectsListener ) ((FsmlToObjectsListener)listener).exitAction(this);
		}
	}

	public final ActionContext action() throws RecognitionException {
		ActionContext _localctx = new ActionContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_action);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(59);
			match(NAME);
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
		"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\3\13@\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\3\2\6\2\20\n\2\r\2\16\2\21\3\2\3\2"+
		"\3\3\3\3\3\3\5\3\31\n\3\3\3\3\3\3\3\3\3\3\3\7\3 \n\3\f\3\16\3#\13\3\3"+
		"\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\5\4.\n\4\3\4\3\4\3\4\3\4\3\4\5\4\65"+
		"\n\4\3\4\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\7\2\2\b\2\4\6\b\n\f\2\2>\2"+
		"\17\3\2\2\2\4\25\3\2\2\2\6&\3\2\2\2\b9\3\2\2\2\n;\3\2\2\2\f=\3\2\2\2\16"+
		"\20\5\4\3\2\17\16\3\2\2\2\20\21\3\2\2\2\21\17\3\2\2\2\21\22\3\2\2\2\22"+
		"\23\3\2\2\2\23\24\7\2\2\3\24\3\3\2\2\2\25\30\b\3\1\2\26\27\7\3\2\2\27"+
		"\31\b\3\1\2\30\26\3\2\2\2\30\31\3\2\2\2\31\32\3\2\2\2\32\33\7\4\2\2\33"+
		"\34\5\b\5\2\34\35\b\3\1\2\35!\7\5\2\2\36 \5\6\4\2\37\36\3\2\2\2 #\3\2"+
		"\2\2!\37\3\2\2\2!\"\3\2\2\2\"$\3\2\2\2#!\3\2\2\2$%\7\6\2\2%\5\3\2\2\2"+
		"&\'\b\4\1\2\'(\5\n\6\2(-\b\4\1\2)*\7\7\2\2*+\5\f\7\2+,\b\4\1\2,.\3\2\2"+
		"\2-)\3\2\2\2-.\3\2\2\2./\3\2\2\2/\64\b\4\1\2\60\61\7\b\2\2\61\62\5\b\5"+
		"\2\62\63\b\4\1\2\63\65\3\2\2\2\64\60\3\2\2\2\64\65\3\2\2\2\65\66\3\2\2"+
		"\2\66\67\b\4\1\2\678\7\t\2\28\7\3\2\2\29:\7\n\2\2:\t\3\2\2\2;<\7\n\2\2"+
		"<\13\3\2\2\2=>\7\n\2\2>\r\3\2\2\2\7\21\30!-\64";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}