import sys
import json
from antlr4 import *
from FsmlExceptions import FsmlException
from FsmlLexer import FsmlLexer
from FsmlParser import FsmlParser
from FsmlVisualizer import draw

def parse(path):
    input = FileStream(path)
    lexer = FsmlLexer(input)
    tokens = CommonTokenStream(lexer)
    parser = FsmlParser(tokens)
    parser.fsm()
    return parser.model.fsm

def main():
    fsm = parse(sys.argv[1])
    open(sys.argv[2], 'w').write(json.dumps(fsm))
    
if __name__ == '__main__':
    main()
