import json
import sys
import unittest

sys.path.append('./generated')
from FsmlSample import turnstile
from FsmlResolutionNotOk import resolutionNotOk
from FsmlConstraints import ok
from FsmlToJSON import parse
from FsmlExceptions import *
from FsmlInterpreter import run
from antlr4.error.Errors import *

# test cases for the OK constraints

class TestOkConstraints(unittest.TestCase):

    def setUp(self):
        self.determinismNotOkFsm = json.load(open("../JSON/tests/determinismNotOk.json"))
        self.idsNotOkFsm = parse("../tests/idsNotOk.fsml")
        self.initialNotOkFsm1 = parse("../tests/initialNotOk1.fsml")
        self.initialNotOkFsm2 = parse("../tests/initialNotOk2.fsml")
        self.reachabilityNotOkFsm = parse("../tests/reachabilityNotOk.fsml")
        self.resolutionNotOkFsm1 = parse("../tests/resolutionNotOk.fsml")
        self.resolutionNotOkFsm2 = json.load(open("../JSON/tests/resolutionNotOk.json"))
        self.resolutionNotOkFsm3 = resolutionNotOk.fsm

    def testDeterminism(self):
        self.assertRaises(FsmlDeterminismException, ok, self.determinismNotOkFsm)
    def testDistinctIDs(self):
        self.assertRaises(FsmlDistinctIdsException, ok, self.idsNotOkFsm)
    def testSingleInitial(self):
        self.assertRaises(FsmlSingleInitialException, ok, self.initialNotOkFsm1)
        self.assertRaises(FsmlSingleInitialException, ok, self.initialNotOkFsm2)
    def testReachability(self):
        self.assertRaises(FsmlReachabilityException, ok, self.reachabilityNotOkFsm)
    def testResolution1(self):
        self.assertRaises(FsmlResolutionException, ok, self.resolutionNotOkFsm1)
    def testResolution2(self):
        self.assertRaises(FsmlResolutionException, ok, self.resolutionNotOkFsm2)
    def testResolution3(self):
        self.assertRaises(FsmlResolutionException, ok, self.resolutionNotOkFsm3)

# test cases for the other constraints

class TestOtherConstraints(unittest.TestCase):

    def setUp(self):
        self.syntaxErrorFsm = "../tests/syntaxError.fsml"
        self.correctFsm = parse("../sample.fsml")
        self.illegalEventInput = json.load(open("tests/illegalEvent.input"))
        self.infeasibleEventInput = json.load(open("tests/infeasibleEvent.input"))
    def testSyntaxError(self):
        self.assertRaises(ParseCancellationException, parse, self.syntaxErrorFsm)
#    def testIllegalEvent(self):
#        self.assertRaises(FsmlIllegalEventException, run, self.correctFsm, self.illegalEventInput)
    def testInfeasibleEvent(self):
        self.assertRaises(FsmlInfeasibleEventException, run, self.correctFsm, self.infeasibleEventInput)


# tests if the baseline output is the same as the output which is produced by the FsmlInterpreter.py module
# and if this output is also the same as the output which is produced by the generated modules

class TestSimulationOutput(unittest.TestCase):

    def setUp(self):
        # import the generated Code
        import Handler
        import Stepper
        self.stepper = Stepper.Stepper()
        self.input = json.load(open("sample.input"))
        self.fsm = parse("../sample.fsml")

    def testSimulationOutput(self):
        # load the base line output
        correctJsonOutput = json.load(open("tests/baselines/sample.output"))

        # produce the output of the generated modules
        generatedJsonOutput = self.stepper.run(self.input)

        # produce the output of the hand-written simulator module
        simulatedJsonOutput = run(self.fsm, self.input)

        # assert all 3 types of output are equal
        self.assertEqual(correctJsonOutput, simulatedJsonOutput)
        self.assertEqual(correctJsonOutput, generatedJsonOutput)

# Test Model and JSON

class TestJSON(unittest.TestCase):

    def setUp(self):
        self.turnstile1 = json.load(open("sample.json", 'r'))
        self.turnstile2 = json.load(open("tests/baselines/sample.json", 'r'))

    def testJSON(self):
        self.assertTrue(json.dumps(self.turnstile1, sort_keys=True)==json.dumps(self.turnstile2, sort_keys=True))
        self.assertTrue(json.dumps(turnstile.fsm, sort_keys=True)==json.dumps(self.turnstile1, sort_keys=True))
        
if __name__ == '__main__':
    unittest.main()
