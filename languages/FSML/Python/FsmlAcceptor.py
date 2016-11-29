from antlr4 import *
from FsmlExceptions import FsmlException
from antlr4.error.Errors import ParseCancellationException
from FsmlLexer import FsmlLexer
from FsmlParser import FsmlParser
import sys

def parse(path):
    input = FileStream(path)
    lexer = FsmlLexer(input)
    tokens = CommonTokenStream(lexer)
    parser = FsmlParser(tokens)
    parser.fsm()
    return parser.model.fsm

try:
    fsm = parse(sys.argv[1])
except ParseCancellationException:
    sys.exit(1)
