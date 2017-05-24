# Generated from Fsml.g4 by ANTLR 4.5.3
# encoding: utf-8
from __future__ import print_function
from antlr4 import *
from io import StringIO

from FsmlModel import Fsm
def serializedATN():
    with StringIO() as buf:
        buf.write(u"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\3")
        buf.write(u"\13;\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7")
        buf.write(u"\3\2\3\2\3\2\6\2\22\n\2\r\2\16\2\23\3\2\3\2\3\3\3\3\3")
        buf.write(u"\3\5\3\33\n\3\3\3\3\3\3\3\3\3\3\3\7\3\"\n\3\f\3\16\3")
        buf.write(u"%\13\3\3\3\3\3\3\4\3\4\3\4\5\4,\n\4\3\4\3\4\5\4\60\n")
        buf.write(u"\4\3\4\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\7\2\2\b\2\4")
        buf.write(u"\6\b\n\f\2\29\2\16\3\2\2\2\4\27\3\2\2\2\6(\3\2\2\2\b")
        buf.write(u"\64\3\2\2\2\n\66\3\2\2\2\f8\3\2\2\2\16\17\b\2\1\2\17")
        buf.write(u"\21\b\2\1\2\20\22\5\4\3\2\21\20\3\2\2\2\22\23\3\2\2\2")
        buf.write(u"\23\21\3\2\2\2\23\24\3\2\2\2\24\25\3\2\2\2\25\26\7\2")
        buf.write(u"\2\3\26\3\3\2\2\2\27\32\b\3\1\2\30\31\7\3\2\2\31\33\b")
        buf.write(u"\3\1\2\32\30\3\2\2\2\32\33\3\2\2\2\33\34\3\2\2\2\34\35")
        buf.write(u"\7\4\2\2\35\36\5\b\5\2\36\37\b\3\1\2\37#\7\5\2\2 \"\5")
        buf.write(u"\6\4\2! \3\2\2\2\"%\3\2\2\2#!\3\2\2\2#$\3\2\2\2$&\3\2")
        buf.write(u"\2\2%#\3\2\2\2&\'\7\6\2\2\'\5\3\2\2\2(+\5\n\6\2)*\7\7")
        buf.write(u"\2\2*,\5\f\7\2+)\3\2\2\2+,\3\2\2\2,/\3\2\2\2-.\7\b\2")
        buf.write(u"\2.\60\5\b\5\2/-\3\2\2\2/\60\3\2\2\2\60\61\3\2\2\2\61")
        buf.write(u"\62\7\t\2\2\62\63\b\4\1\2\63\7\3\2\2\2\64\65\7\n\2\2")
        buf.write(u"\65\t\3\2\2\2\66\67\7\n\2\2\67\13\3\2\2\289\7\n\2\29")
        buf.write(u"\r\3\2\2\2\7\23\32#+/")
        return buf.getvalue()


class FsmlParser ( Parser ):

    grammarFileName = "Fsml.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ u"<INVALID>", u"'initial'", u"'state'", u"'{'", u"'}'", 
                     u"'/'", u"'->'", u"';'" ]

    symbolicNames = [ u"<INVALID>", u"<INVALID>", u"<INVALID>", u"<INVALID>", 
                      u"<INVALID>", u"<INVALID>", u"<INVALID>", u"<INVALID>", 
                      u"NAME", u"WS" ]

    RULE_fsm = 0
    RULE_statedecl = 1
    RULE_transition = 2
    RULE_stateid = 3
    RULE_event = 4
    RULE_action = 5

    ruleNames =  [ u"fsm", u"statedecl", u"transition", u"stateid", u"event", 
                   u"action" ]

    EOF = Token.EOF
    T__0=1
    T__1=2
    T__2=3
    T__3=4
    T__4=5
    T__5=6
    T__6=7
    NAME=8
    WS=9

    def __init__(self, input):
        super(FsmlParser, self).__init__(input)
        self.checkVersion("4.5.3")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None



    class FsmContext(ParserRuleContext):

        def __init__(self, parser, parent=None, invokingState=-1):
            super(FsmlParser.FsmContext, self).__init__(parent, invokingState)
            self.parser = parser

        def EOF(self):
            return self.getToken(FsmlParser.EOF, 0)

        def statedecl(self, i=None):
            if i is None:
                return self.getTypedRuleContexts(FsmlParser.StatedeclContext)
            else:
                return self.getTypedRuleContext(FsmlParser.StatedeclContext,i)


        def getRuleIndex(self):
            return FsmlParser.RULE_fsm

        def enterRule(self, listener):
            if hasattr(listener, "enterFsm"):
                listener.enterFsm(self)

        def exitRule(self, listener):
            if hasattr(listener, "exitFsm"):
                listener.exitFsm(self)




    def fsm(self):

        localctx = FsmlParser.FsmContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_fsm)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self._errHandler = BailErrorStrategy()
            self.model = Fsm()
            self.state = 15 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 14
                self.statedecl()
                self.state = 17 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if not (_la==FsmlParser.T__0 or _la==FsmlParser.T__1):
                    break

            self.state = 19
            self.match(FsmlParser.EOF)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx

    class StatedeclContext(ParserRuleContext):

        def __init__(self, parser, parent=None, invokingState=-1):
            super(FsmlParser.StatedeclContext, self).__init__(parent, invokingState)
            self.parser = parser
            self._stateid = None # StateidContext

        def stateid(self):
            return self.getTypedRuleContext(FsmlParser.StateidContext,0)


        def transition(self, i=None):
            if i is None:
                return self.getTypedRuleContexts(FsmlParser.TransitionContext)
            else:
                return self.getTypedRuleContext(FsmlParser.TransitionContext,i)


        def getRuleIndex(self):
            return FsmlParser.RULE_statedecl

        def enterRule(self, listener):
            if hasattr(listener, "enterStatedecl"):
                listener.enterStatedecl(self)

        def exitRule(self, listener):
            if hasattr(listener, "exitStatedecl"):
                listener.exitStatedecl(self)




    def statedecl(self):

        localctx = FsmlParser.StatedeclContext(self, self._ctx, self.state)
        self.enterRule(localctx, 2, self.RULE_statedecl)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            initial=False
            self.state = 24
            _la = self._input.LA(1)
            if _la==FsmlParser.T__0:
                self.state = 22
                self.match(FsmlParser.T__0)
                initial=True


            self.state = 26
            self.match(FsmlParser.T__1)
            self.state = 27
            localctx._stateid = self.stateid()
            self.model.addStateNoDefault(initial, (None if localctx._stateid is None else self._input.getText((localctx._stateid.start,localctx._stateid.stop))))
            self.state = 29
            self.match(FsmlParser.T__2)
            self.state = 33
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==FsmlParser.NAME:
                self.state = 30
                self.transition()
                self.state = 35
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 36
            self.match(FsmlParser.T__3)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx

    class TransitionContext(ParserRuleContext):

        def __init__(self, parser, parent=None, invokingState=-1):
            super(FsmlParser.TransitionContext, self).__init__(parent, invokingState)
            self.parser = parser
            self._event = None # EventContext
            self._action = None # ActionContext
            self._stateid = None # StateidContext

        def event(self):
            return self.getTypedRuleContext(FsmlParser.EventContext,0)


        def action(self):
            return self.getTypedRuleContext(FsmlParser.ActionContext,0)


        def stateid(self):
            return self.getTypedRuleContext(FsmlParser.StateidContext,0)


        def getRuleIndex(self):
            return FsmlParser.RULE_transition

        def enterRule(self, listener):
            if hasattr(listener, "enterTransition"):
                listener.enterTransition(self)

        def exitRule(self, listener):
            if hasattr(listener, "exitTransition"):
                listener.exitTransition(self)




    def transition(self):

        localctx = FsmlParser.TransitionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_transition)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 38
            localctx._event = self.event()
            self.state = 41
            _la = self._input.LA(1)
            if _la==FsmlParser.T__4:
                self.state = 39
                self.match(FsmlParser.T__4)
                self.state = 40
                localctx._action = self.action()


            self.state = 45
            _la = self._input.LA(1)
            if _la==FsmlParser.T__5:
                self.state = 43
                self.match(FsmlParser.T__5)
                self.state = 44
                localctx._stateid = self.stateid()


            self.state = 47
            self.match(FsmlParser.T__6)
            self.model.addTransition((None if localctx._event is None else self._input.getText((localctx._event.start,localctx._event.stop))), (None if localctx._action is None else self._input.getText((localctx._action.start,localctx._action.stop))), (None if localctx._stateid is None else self._input.getText((localctx._stateid.start,localctx._stateid.stop))))
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx

    class StateidContext(ParserRuleContext):

        def __init__(self, parser, parent=None, invokingState=-1):
            super(FsmlParser.StateidContext, self).__init__(parent, invokingState)
            self.parser = parser

        def NAME(self):
            return self.getToken(FsmlParser.NAME, 0)

        def getRuleIndex(self):
            return FsmlParser.RULE_stateid

        def enterRule(self, listener):
            if hasattr(listener, "enterStateid"):
                listener.enterStateid(self)

        def exitRule(self, listener):
            if hasattr(listener, "exitStateid"):
                listener.exitStateid(self)




    def stateid(self):

        localctx = FsmlParser.StateidContext(self, self._ctx, self.state)
        self.enterRule(localctx, 6, self.RULE_stateid)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 50
            self.match(FsmlParser.NAME)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx

    class EventContext(ParserRuleContext):

        def __init__(self, parser, parent=None, invokingState=-1):
            super(FsmlParser.EventContext, self).__init__(parent, invokingState)
            self.parser = parser

        def NAME(self):
            return self.getToken(FsmlParser.NAME, 0)

        def getRuleIndex(self):
            return FsmlParser.RULE_event

        def enterRule(self, listener):
            if hasattr(listener, "enterEvent"):
                listener.enterEvent(self)

        def exitRule(self, listener):
            if hasattr(listener, "exitEvent"):
                listener.exitEvent(self)




    def event(self):

        localctx = FsmlParser.EventContext(self, self._ctx, self.state)
        self.enterRule(localctx, 8, self.RULE_event)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 52
            self.match(FsmlParser.NAME)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx

    class ActionContext(ParserRuleContext):

        def __init__(self, parser, parent=None, invokingState=-1):
            super(FsmlParser.ActionContext, self).__init__(parent, invokingState)
            self.parser = parser

        def NAME(self):
            return self.getToken(FsmlParser.NAME, 0)

        def getRuleIndex(self):
            return FsmlParser.RULE_action

        def enterRule(self, listener):
            if hasattr(listener, "enterAction"):
                listener.enterAction(self)

        def exitRule(self, listener):
            if hasattr(listener, "exitAction"):
                listener.exitAction(self)




    def action(self):

        localctx = FsmlParser.ActionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 10, self.RULE_action)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 54
            self.match(FsmlParser.NAME)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





