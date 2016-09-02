// Generated from org/softlang/EiplChecker.g4 by ANTLR 4.4

package org.softlang;

import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class EiplCheckerLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.4", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__16=1, T__15=2, T__14=3, T__13=4, T__12=5, T__11=6, T__10=7, T__9=8, 
		T__8=9, T__7=10, T__6=11, T__5=12, T__4=13, T__3=14, T__2=15, T__1=16, 
		T__0=17, NAME=18, INTEGER=19, WS=20;
	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] tokenNames = {
		"'\\u0000'", "'\\u0001'", "'\\u0002'", "'\\u0003'", "'\\u0004'", "'\\u0005'", 
		"'\\u0006'", "'\\u0007'", "'\b'", "'\t'", "'\n'", "'\\u000B'", "'\f'", 
		"'\r'", "'\\u000E'", "'\\u000F'", "'\\u0010'", "'\\u0011'", "'\\u0012'", 
		"'\\u0013'", "'\\u0014'"
	};
	public static final String[] ruleNames = {
		"T__16", "T__15", "T__14", "T__13", "T__12", "T__11", "T__10", "T__9", 
		"T__8", "T__7", "T__6", "T__5", "T__4", "T__3", "T__2", "T__1", "T__0", 
		"NAME", "INTEGER", "WS"
	};


	public boolean ok = true;
	public EiplEnv env = new EiplEnv();


	public EiplCheckerLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "EiplChecker.g4"; }

	@Override
	public String[] getTokenNames() { return tokenNames; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\2\26{\b\1\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\3\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\4\3\4\3\5\3\5\3\5\3\5\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\t\3"+
		"\n\3\n\3\n\3\n\3\n\3\13\3\13\3\13\3\13\3\13\3\f\3\f\3\f\3\f\3\f\3\r\3"+
		"\r\3\r\3\r\3\r\3\r\3\16\3\16\3\17\3\17\3\17\3\17\3\17\3\20\3\20\3\20\3"+
		"\20\3\21\3\21\3\22\3\22\3\23\6\23l\n\23\r\23\16\23m\3\24\6\24q\n\24\r"+
		"\24\16\24r\3\25\6\25v\n\25\r\25\16\25w\3\25\3\25\2\2\26\3\3\5\4\7\5\t"+
		"\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35\20\37\21!\22#\23"+
		"%\24\'\25)\26\3\2\4\4\2C\\c|\5\2\13\f\17\17\"\"}\2\3\3\2\2\2\2\5\3\2\2"+
		"\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21"+
		"\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2"+
		"\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3"+
		"\2\2\2\2)\3\2\2\2\3+\3\2\2\2\5/\3\2\2\2\7\65\3\2\2\2\t\67\3\2\2\2\13="+
		"\3\2\2\2\r?\3\2\2\2\17A\3\2\2\2\21C\3\2\2\2\23F\3\2\2\2\25K\3\2\2\2\27"+
		"P\3\2\2\2\31U\3\2\2\2\33[\3\2\2\2\35]\3\2\2\2\37b\3\2\2\2!f\3\2\2\2#h"+
		"\3\2\2\2%k\3\2\2\2\'p\3\2\2\2)u\3\2\2\2+,\7x\2\2,-\7c\2\2-.\7t\2\2.\4"+
		"\3\2\2\2/\60\7y\2\2\60\61\7t\2\2\61\62\7k\2\2\62\63\7v\2\2\63\64\7g\2"+
		"\2\64\6\3\2\2\2\65\66\7}\2\2\66\b\3\2\2\2\678\7y\2\289\7j\2\29:\7k\2\2"+
		":;\7n\2\2;<\7g\2\2<\n\3\2\2\2=>\7=\2\2>\f\3\2\2\2?@\7\177\2\2@\16\3\2"+
		"\2\2AB\7?\2\2B\20\3\2\2\2CD\7k\2\2DE\7h\2\2E\22\3\2\2\2FG\7e\2\2GH\7c"+
		"\2\2HI\7n\2\2IJ\7n\2\2J\24\3\2\2\2KL\7V\2\2LM\7Q\2\2MN\7F\2\2NO\7Q\2\2"+
		"O\26\3\2\2\2PQ\7g\2\2QR\7n\2\2RS\7u\2\2ST\7g\2\2T\30\3\2\2\2UV\7d\2\2"+
		"VW\7g\2\2WX\7i\2\2XY\7k\2\2YZ\7p\2\2Z\32\3\2\2\2[\\\7*\2\2\\\34\3\2\2"+
		"\2]^\7r\2\2^_\7t\2\2_`\7q\2\2`a\7e\2\2a\36\3\2\2\2bc\7g\2\2cd\7p\2\2d"+
		"e\7f\2\2e \3\2\2\2fg\7+\2\2g\"\3\2\2\2hi\7-\2\2i$\3\2\2\2jl\t\2\2\2kj"+
		"\3\2\2\2lm\3\2\2\2mk\3\2\2\2mn\3\2\2\2n&\3\2\2\2oq\4\62;\2po\3\2\2\2q"+
		"r\3\2\2\2rp\3\2\2\2rs\3\2\2\2s(\3\2\2\2tv\t\3\2\2ut\3\2\2\2vw\3\2\2\2"+
		"wu\3\2\2\2wx\3\2\2\2xy\3\2\2\2yz\b\25\2\2z*\3\2\2\2\6\2mrw\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}