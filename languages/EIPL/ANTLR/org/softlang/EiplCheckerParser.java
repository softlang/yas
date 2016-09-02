// Generated from org/softlang/EiplChecker.g4 by ANTLR 4.4

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
public class EiplCheckerParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.4", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__16=1, T__15=2, T__14=3, T__13=4, T__12=5, T__11=6, T__10=7, T__9=8, 
		T__8=9, T__7=10, T__6=11, T__5=12, T__4=13, T__3=14, T__2=15, T__1=16, 
		T__0=17, NAME=18, INTEGER=19, WS=20;
	public static final String[] tokenNames = {
		"<INVALID>", "'var'", "'write'", "'{'", "'while'", "';'", "'}'", "'='", 
		"'if'", "'call'", "'TODO'", "'else'", "'begin'", "'('", "'proc'", "'end'", 
		"')'", "'+'", "NAME", "INTEGER", "WS"
	};
	public static final int
		RULE_program = 0, RULE_scope = 1, RULE_decl = 2, RULE_stmt = 3, RULE_expr = 4;
	public static final String[] ruleNames = {
		"program", "scope", "decl", "stmt", "expr"
	};

	@Override
	public String getGrammarFileName() { return "EiplChecker.g4"; }

	@Override
	public String[] getTokenNames() { return tokenNames; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }


	public boolean ok = true;
	public EiplEnv env = new EiplEnv();

	public EiplCheckerParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class ProgramContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(EiplCheckerParser.EOF, 0); }
		public ScopeContext scope() {
			return getRuleContext(ScopeContext.class,0);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof EiplCheckerListener ) ((EiplCheckerListener)listener).enterProgram(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof EiplCheckerListener ) ((EiplCheckerListener)listener).exitProgram(this);
		}
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(10); scope();
			setState(11); match(EOF);
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

	public static class ScopeContext extends ParserRuleContext {
		public DeclContext decl(int i) {
			return getRuleContext(DeclContext.class,i);
		}
		public List<DeclContext> decl() {
			return getRuleContexts(DeclContext.class);
		}
		public StmtContext stmt() {
			return getRuleContext(StmtContext.class,0);
		}
		public ScopeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_scope; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof EiplCheckerListener ) ((EiplCheckerListener)listener).enterScope(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof EiplCheckerListener ) ((EiplCheckerListener)listener).exitScope(this);
		}
	}

	public final ScopeContext scope() throws RecognitionException {
		ScopeContext _localctx = new ScopeContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_scope);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			 env.enterScope(); 
			setState(14); match(T__5);
			setState(18);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__16 || _la==T__3) {
				{
				{
				setState(15); decl();
				}
				}
				setState(20);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(21); stmt();
			setState(22); match(T__2);
			 env.enterScope(); 
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

	public static class DeclContext extends ParserRuleContext {
		public Token NAME;
		public ExprContext expr;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode NAME() { return getToken(EiplCheckerParser.NAME, 0); }
		public StmtContext stmt() {
			return getRuleContext(StmtContext.class,0);
		}
		public DeclContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_decl; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof EiplCheckerListener ) ((EiplCheckerListener)listener).enterDecl(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof EiplCheckerListener ) ((EiplCheckerListener)listener).exitDecl(this);
		}
	}

	public final DeclContext decl() throws RecognitionException {
		DeclContext _localctx = new DeclContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_decl);
		try {
			setState(37);
			switch (_input.LA(1)) {
			case T__16:
				enterOuterAlt(_localctx, 1);
				{
				setState(25); match(T__16);
				setState(26); ((DeclContext)_localctx).NAME = match(NAME);
				setState(27); match(T__10);
				setState(28); ((DeclContext)_localctx).expr = expr(0);
				setState(29); match(T__12);

				        ok &= env.noClash((((DeclContext)_localctx).NAME!=null?((DeclContext)_localctx).NAME.getText():null));
				        env.addVar((((DeclContext)_localctx).NAME!=null?((DeclContext)_localctx).NAME.getText():null), ((DeclContext)_localctx).expr.type);
				      
				}
				break;
			case T__3:
				enterOuterAlt(_localctx, 2);
				{
				setState(32); match(T__3);
				setState(33); ((DeclContext)_localctx).NAME = match(NAME);
				setState(34); stmt();

				        ok &= env.noClash((((DeclContext)_localctx).NAME!=null?((DeclContext)_localctx).NAME.getText():null));
				        env.addProc((((DeclContext)_localctx).NAME!=null?((DeclContext)_localctx).NAME.getText():null));
				      
				}
				break;
			default:
				throw new NoViableAltException(this);
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

	public static class StmtContext extends ParserRuleContext {
		public Token NAME;
		public ExprContext expr;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode NAME() { return getToken(EiplCheckerParser.NAME, 0); }
		public StmtContext stmt(int i) {
			return getRuleContext(StmtContext.class,i);
		}
		public ScopeContext scope() {
			return getRuleContext(ScopeContext.class,0);
		}
		public List<StmtContext> stmt() {
			return getRuleContexts(StmtContext.class);
		}
		public StmtContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_stmt; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof EiplCheckerListener ) ((EiplCheckerListener)listener).enterStmt(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof EiplCheckerListener ) ((EiplCheckerListener)listener).exitStmt(this);
		}
	}

	public final StmtContext stmt() throws RecognitionException {
		StmtContext _localctx = new StmtContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_stmt);
		int _la;
		try {
			setState(81);
			switch (_input.LA(1)) {
			case T__12:
				enterOuterAlt(_localctx, 1);
				{
				setState(39); match(T__12);
				}
				break;
			case NAME:
				enterOuterAlt(_localctx, 2);
				{
				setState(40); ((StmtContext)_localctx).NAME = match(NAME);
				setState(41); match(T__10);
				setState(42); ((StmtContext)_localctx).expr = expr(0);
				setState(43); match(T__12);

				        ok &= env.isVar((((StmtContext)_localctx).NAME!=null?((StmtContext)_localctx).NAME.getText():null))
				           && env.getType((((StmtContext)_localctx).NAME!=null?((StmtContext)_localctx).NAME.getText():null)) == ((StmtContext)_localctx).expr.type;
				      
				}
				break;
			case T__8:
				enterOuterAlt(_localctx, 3);
				{
				setState(46); match(T__8);
				setState(47); ((StmtContext)_localctx).NAME = match(NAME);
				setState(48); match(T__12);
				 ok &= env.isProc((((StmtContext)_localctx).NAME!=null?((StmtContext)_localctx).NAME.getText():null)); 
				}
				break;
			case T__5:
				enterOuterAlt(_localctx, 4);
				{
				setState(50); scope();
				}
				break;
			case T__9:
				enterOuterAlt(_localctx, 5);
				{
				setState(51); match(T__9);
				setState(52); match(T__4);
				setState(53); ((StmtContext)_localctx).expr = expr(0);
				setState(54); match(T__1);
				setState(55); stmt();
				setState(58);
				switch ( getInterpreter().adaptivePredict(_input,2,_ctx) ) {
				case 1:
					{
					setState(56); match(T__6);
					setState(57); stmt();
					}
					break;
				}
				 ok &= ((StmtContext)_localctx).expr.type == EiplEnv.Type.BoolType; 
				}
				break;
			case T__13:
				enterOuterAlt(_localctx, 6);
				{
				setState(62); match(T__13);
				setState(63); match(T__4);
				setState(64); ((StmtContext)_localctx).expr = expr(0);
				setState(65); match(T__1);
				setState(66); stmt();
				 ok &= ((StmtContext)_localctx).expr.type == EiplEnv.Type.BoolType; 
				}
				break;
			case T__14:
				enterOuterAlt(_localctx, 7);
				{
				setState(69); match(T__14);
				setState(73);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__15) | (1L << T__14) | (1L << T__13) | (1L << T__12) | (1L << T__9) | (1L << T__8) | (1L << T__5) | (1L << NAME))) != 0)) {
					{
					{
					setState(70); stmt();
					}
					}
					setState(75);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				setState(76); match(T__11);
				}
				break;
			case T__15:
				enterOuterAlt(_localctx, 8);
				{
				setState(77); match(T__15);
				setState(78); expr(0);
				setState(79); match(T__12);
				}
				break;
			default:
				throw new NoViableAltException(this);
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

	public static class ExprContext extends ParserRuleContext {
		public EiplEnv.Type type;
		public ExprContext expr1;
		public Token NAME;
		public ExprContext expr2;
		public TerminalNode INTEGER() { return getToken(EiplCheckerParser.INTEGER, 0); }
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public TerminalNode NAME() { return getToken(EiplCheckerParser.NAME, 0); }
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof EiplCheckerListener ) ((EiplCheckerListener)listener).enterExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof EiplCheckerListener ) ((EiplCheckerListener)listener).exitExpr(this);
		}
	}

	public final ExprContext expr() throws RecognitionException {
		return expr(0);
	}

	private ExprContext expr(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExprContext _localctx = new ExprContext(_ctx, _parentState);
		ExprContext _prevctx = _localctx;
		int _startState = 8;
		enterRecursionRule(_localctx, 8, RULE_expr, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(90);
			switch (_input.LA(1)) {
			case INTEGER:
				{
				setState(84); match(INTEGER);
				 ((ExprContext)_localctx).type =  EiplEnv.Type.IntType; 
				}
				break;
			case NAME:
				{
				setState(86); ((ExprContext)_localctx).NAME = match(NAME);

				        ok &= env.isVar((((ExprContext)_localctx).NAME!=null?((ExprContext)_localctx).NAME.getText():null));
				        ((ExprContext)_localctx).type =  env.getType((((ExprContext)_localctx).NAME!=null?((ExprContext)_localctx).NAME.getText():null));
				      
				}
				break;
			case T__7:
				{
				setState(88); match(T__7);
				 ((ExprContext)_localctx).type =  EiplEnv.Type.NoType; 
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			_ctx.stop = _input.LT(-1);
			setState(99);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,6,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new ExprContext(_parentctx, _parentState);
					_localctx.expr1 = _prevctx;
					pushNewRecursionContext(_localctx, _startState, RULE_expr);
					setState(92);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(93); match(T__0);
					setState(94); ((ExprContext)_localctx).expr2 = expr(3);

					                  ok &= ((ExprContext)_localctx).expr1.type == EiplEnv.Type.IntType
					                     && ((ExprContext)_localctx).expr2.type == EiplEnv.Type.IntType;
					                  ((ExprContext)_localctx).type =  EiplEnv.Type.IntType;
					                
					}
					} 
				}
				setState(101);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,6,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 4: return expr_sempred((ExprContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0: return precpred(_ctx, 2);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\3\26i\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\4\5\t\5\4\6\t\6\3\2\3\2\3\2\3\3\3\3\3\3\7\3\23\n\3\f\3\16\3"+
		"\26\13\3\3\3\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3"+
		"\4\5\4(\n\4\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\5\5=\n\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\7\5J\n\5\f\5\16\5M\13\5\3\5\3\5\3\5\3\5\3\5\5\5T\n\5\3\6\3\6\3\6\3"+
		"\6\3\6\3\6\3\6\5\6]\n\6\3\6\3\6\3\6\3\6\3\6\7\6d\n\6\f\6\16\6g\13\6\3"+
		"\6\2\3\n\7\2\4\6\b\n\2\2q\2\f\3\2\2\2\4\17\3\2\2\2\6\'\3\2\2\2\bS\3\2"+
		"\2\2\n\\\3\2\2\2\f\r\5\4\3\2\r\16\7\2\2\3\16\3\3\2\2\2\17\20\b\3\1\2\20"+
		"\24\7\16\2\2\21\23\5\6\4\2\22\21\3\2\2\2\23\26\3\2\2\2\24\22\3\2\2\2\24"+
		"\25\3\2\2\2\25\27\3\2\2\2\26\24\3\2\2\2\27\30\5\b\5\2\30\31\7\21\2\2\31"+
		"\32\b\3\1\2\32\5\3\2\2\2\33\34\7\3\2\2\34\35\7\24\2\2\35\36\7\t\2\2\36"+
		"\37\5\n\6\2\37 \7\7\2\2 !\b\4\1\2!(\3\2\2\2\"#\7\20\2\2#$\7\24\2\2$%\5"+
		"\b\5\2%&\b\4\1\2&(\3\2\2\2\'\33\3\2\2\2\'\"\3\2\2\2(\7\3\2\2\2)T\7\7\2"+
		"\2*+\7\24\2\2+,\7\t\2\2,-\5\n\6\2-.\7\7\2\2./\b\5\1\2/T\3\2\2\2\60\61"+
		"\7\13\2\2\61\62\7\24\2\2\62\63\7\7\2\2\63T\b\5\1\2\64T\5\4\3\2\65\66\7"+
		"\n\2\2\66\67\7\17\2\2\678\5\n\6\289\7\22\2\29<\5\b\5\2:;\7\r\2\2;=\5\b"+
		"\5\2<:\3\2\2\2<=\3\2\2\2=>\3\2\2\2>?\b\5\1\2?T\3\2\2\2@A\7\6\2\2AB\7\17"+
		"\2\2BC\5\n\6\2CD\7\22\2\2DE\5\b\5\2EF\b\5\1\2FT\3\2\2\2GK\7\5\2\2HJ\5"+
		"\b\5\2IH\3\2\2\2JM\3\2\2\2KI\3\2\2\2KL\3\2\2\2LN\3\2\2\2MK\3\2\2\2NT\7"+
		"\b\2\2OP\7\4\2\2PQ\5\n\6\2QR\7\7\2\2RT\3\2\2\2S)\3\2\2\2S*\3\2\2\2S\60"+
		"\3\2\2\2S\64\3\2\2\2S\65\3\2\2\2S@\3\2\2\2SG\3\2\2\2SO\3\2\2\2T\t\3\2"+
		"\2\2UV\b\6\1\2VW\7\25\2\2W]\b\6\1\2XY\7\24\2\2Y]\b\6\1\2Z[\7\f\2\2[]\b"+
		"\6\1\2\\U\3\2\2\2\\X\3\2\2\2\\Z\3\2\2\2]e\3\2\2\2^_\f\4\2\2_`\7\23\2\2"+
		"`a\5\n\6\5ab\b\6\1\2bd\3\2\2\2c^\3\2\2\2dg\3\2\2\2ec\3\2\2\2ef\3\2\2\2"+
		"f\13\3\2\2\2ge\3\2\2\2\t\24\'<KS\\e";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}