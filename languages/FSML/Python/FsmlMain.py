import json
from antlr4 import *
from FsmlExceptions import FsmlException
from FsmlLexer import FsmlLexer
from FsmlParser import FsmlParser
from FsmlConstraints import ok
from FsmlSimulator import simulate
from FsmlCodeGenerator import generateCode
from FsmlVisualizer import draw

def parse(path):
    input = FileStream(path)
    lexer = FsmlLexer(input)
    tokens = CommonTokenStream(lexer)
    parser = FsmlParser(tokens)
    parser.fsm()
    return parser.model.fsm

def main():
    try:
        fsm = parse("../sample.fsml")
        sampleInput = json.load(open("./sample.input", "r"))

        # just for visualization of the fsm dict (not needed anywhere in the code)
        jsonFile = open("./sample.json", 'w')
        jsonFile.write(json.dumps(fsm))

        # check the ok constraints
        ok(fsm)
        #simulate the fsm
        output = simulate(fsm, sampleInput)
        # dump the simulation output to file
        outFile = open("./sample.output", 'w')
        outFile.write(json.dumps(output))

        #generate Code
        generateCode(fsm)

        #draw fsm
        draw(fsm).write("dot/sample.dot")

    except FsmlException:
        raise

if __name__ == '__main__':
    main()
