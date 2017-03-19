// Generated from BnlEbnf.g4 by ANTLR 4.4
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
public class BnlEbnfParser extends Parser {
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
		RULE_number = 0, RULE_bit = 1;
	public static final String[] ruleNames = {
		"number", "bit"
	};

	@Override
	public String getGrammarFileName() { return "BnlEbnf.g4"; }

	@Override
	public String[] getTokenNames() { return tokenNames; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public BnlEbnfParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class NumberContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(BnlEbnfParser.EOF, 0); }
		public List<BitContext> bit() {
			return getRuleContexts(BitContext.class);
		}
		public TerminalNode WS() { return getToken(BnlEbnfParser.WS, 0); }
		public BitContext bit(int i) {
			return getRuleContext(BitContext.class,i);
		}
		public NumberContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_number; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof BnlEbnfListener ) ((BnlEbnfListener)listener).enterNumber(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof BnlEbnfListener ) ((BnlEbnfListener)listener).exitNumber(this);
		}
	}

	public final NumberContext number() throws RecognitionException {
		NumberContext _localctx = new NumberContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_number);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(5); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(4); bit();
				}
				}
				setState(7); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==T__2 || _la==T__1 );
			setState(15);
			_la = _input.LA(1);
			if (_la==T__0) {
				{
				setState(9); match(T__0);
				setState(11); 
				_errHandler.sync(this);
				_la = _input.LA(1);
				do {
					{
					{
					setState(10); bit();
					}
					}
					setState(13); 
					_errHandler.sync(this);
					_la = _input.LA(1);
				} while ( _la==T__2 || _la==T__1 );
				}
			}

			setState(18);
			_la = _input.LA(1);
			if (_la==WS) {
				{
				setState(17); match(WS);
				}
			}

			setState(20); match(EOF);
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

	public static class BitContext extends ParserRuleContext {
		public BitContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_bit; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof BnlEbnfListener ) ((BnlEbnfListener)listener).enterBit(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof BnlEbnfListener ) ((BnlEbnfListener)listener).exitBit(this);
		}
	}

	public final BitContext bit() throws RecognitionException {
		BitContext _localctx = new BitContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_bit);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(22);
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

	public static final String _serializedATN =
		"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\3\6\33\4\2\t\2\4\3"+
		"\t\3\3\2\6\2\b\n\2\r\2\16\2\t\3\2\3\2\6\2\16\n\2\r\2\16\2\17\5\2\22\n"+
		"\2\3\2\5\2\25\n\2\3\2\3\2\3\3\3\3\3\3\2\2\4\2\4\2\3\3\2\3\4\34\2\7\3\2"+
		"\2\2\4\30\3\2\2\2\6\b\5\4\3\2\7\6\3\2\2\2\b\t\3\2\2\2\t\7\3\2\2\2\t\n"+
		"\3\2\2\2\n\21\3\2\2\2\13\r\7\5\2\2\f\16\5\4\3\2\r\f\3\2\2\2\16\17\3\2"+
		"\2\2\17\r\3\2\2\2\17\20\3\2\2\2\20\22\3\2\2\2\21\13\3\2\2\2\21\22\3\2"+
		"\2\2\22\24\3\2\2\2\23\25\7\6\2\2\24\23\3\2\2\2\24\25\3\2\2\2\25\26\3\2"+
		"\2\2\26\27\7\2\2\3\27\3\3\2\2\2\30\31\t\2\2\2\31\5\3\2\2\2\6\t\17\21\24";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}