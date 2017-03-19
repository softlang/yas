// Generated from BnlBnf.g4 by ANTLR 4.4
package org.softlang.bnl;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class BnlBnfParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.4", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__2=1, T__1=2, T__0=3, WS=4;
	public static final String[] tokenNames = {
		"<INVALID>", "'0'", "'1'", "'.'", "WS"
	};
	public static final int
		RULE_number = 0, RULE_bits = 1, RULE_bit = 2, RULE_rest = 3;
	public static final String[] ruleNames = {
		"number", "bits", "bit", "rest"
	};

	@Override
	public String getGrammarFileName() { return "BnlBnf.g4"; }

	@Override
	public String[] getTokenNames() { return tokenNames; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public BnlBnfParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class NumberContext extends ParserRuleContext {
		public BitsContext bits() {
			return getRuleContext(BitsContext.class,0);
		}
		public TerminalNode EOF() { return getToken(BnlBnfParser.EOF, 0); }
		public TerminalNode WS() { return getToken(BnlBnfParser.WS, 0); }
		public RestContext rest() {
			return getRuleContext(RestContext.class,0);
		}
		public NumberContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_number; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof BnlBnfListener ) ((BnlBnfListener)listener).enterNumber(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof BnlBnfListener ) ((BnlBnfListener)listener).exitNumber(this);
		}
	}

	public final NumberContext number() throws RecognitionException {
		NumberContext _localctx = new NumberContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_number);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(8); bits(0);
			setState(9); rest();
			setState(11);
			_la = _input.LA(1);
			if (_la==WS) {
				{
				setState(10); match(WS);
				}
			}

			setState(13); match(EOF);
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

	public static class BitsContext extends ParserRuleContext {
		public BitsContext bits() {
			return getRuleContext(BitsContext.class,0);
		}
		public BitContext bit() {
			return getRuleContext(BitContext.class,0);
		}
		public BitsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_bits; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof BnlBnfListener ) ((BnlBnfListener)listener).enterBits(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof BnlBnfListener ) ((BnlBnfListener)listener).exitBits(this);
		}
	}

	public final BitsContext bits() throws RecognitionException {
		return bits(0);
	}

	private BitsContext bits(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		BitsContext _localctx = new BitsContext(_ctx, _parentState);
		BitsContext _prevctx = _localctx;
		int _startState = 2;
		enterRecursionRule(_localctx, 2, RULE_bits, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(16); bit();
			}
			_ctx.stop = _input.LT(-1);
			setState(22);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,1,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new BitsContext(_parentctx, _parentState);
					pushNewRecursionContext(_localctx, _startState, RULE_bits);
					setState(18);
					if (!(precpred(_ctx, 1))) throw new FailedPredicateException(this, "precpred(_ctx, 1)");
					setState(19); bit();
					}
					} 
				}
				setState(24);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,1,_ctx);
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

	public static class BitContext extends ParserRuleContext {
		public BitContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_bit; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof BnlBnfListener ) ((BnlBnfListener)listener).enterBit(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof BnlBnfListener ) ((BnlBnfListener)listener).exitBit(this);
		}
	}

	public final BitContext bit() throws RecognitionException {
		BitContext _localctx = new BitContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_bit);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(25);
			_la = _input.LA(1);
			if ( !(_la==T__2 || _la==T__1) ) {
			_errHandler.recoverInline(this);
			}
			consume();
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

	public static class RestContext extends ParserRuleContext {
		public BitsContext bits() {
			return getRuleContext(BitsContext.class,0);
		}
		public RestContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_rest; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof BnlBnfListener ) ((BnlBnfListener)listener).enterRest(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof BnlBnfListener ) ((BnlBnfListener)listener).exitRest(this);
		}
	}

	public final RestContext rest() throws RecognitionException {
		RestContext _localctx = new RestContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_rest);
		try {
			setState(30);
			switch (_input.LA(1)) {
			case EOF:
			case WS:
				enterOuterAlt(_localctx, 1);
				{
				}
				break;
			case T__0:
				enterOuterAlt(_localctx, 2);
				{
				setState(28); match(T__0);
				setState(29); bits(0);
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

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 1: return bits_sempred((BitsContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean bits_sempred(BitsContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0: return precpred(_ctx, 1);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\3\6#\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\4\5\t\5\3\2\3\2\3\2\5\2\16\n\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3"+
		"\7\3\27\n\3\f\3\16\3\32\13\3\3\4\3\4\3\5\3\5\3\5\5\5!\n\5\3\5\2\3\4\6"+
		"\2\4\6\b\2\3\3\2\3\4!\2\n\3\2\2\2\4\21\3\2\2\2\6\33\3\2\2\2\b \3\2\2\2"+
		"\n\13\5\4\3\2\13\r\5\b\5\2\f\16\7\6\2\2\r\f\3\2\2\2\r\16\3\2\2\2\16\17"+
		"\3\2\2\2\17\20\7\2\2\3\20\3\3\2\2\2\21\22\b\3\1\2\22\23\5\6\4\2\23\30"+
		"\3\2\2\2\24\25\f\3\2\2\25\27\5\6\4\2\26\24\3\2\2\2\27\32\3\2\2\2\30\26"+
		"\3\2\2\2\30\31\3\2\2\2\31\5\3\2\2\2\32\30\3\2\2\2\33\34\t\2\2\2\34\7\3"+
		"\2\2\2\35!\3\2\2\2\36\37\7\5\2\2\37!\5\4\3\2 \35\3\2\2\2 \36\3\2\2\2!"+
		"\t\3\2\2\2\5\r\30 ";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}