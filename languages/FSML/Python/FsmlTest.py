import json
import sys
import unittest

sys.path.append('./generated')
from FsmlConstraints import ok
from FsmlMain import parse
from FsmlExceptions import *
from FsmlSimulator import simulate
from antlr4.error.Errors import *

# test cases for the OK constraints

class TestOkConstraints(unittest.TestCase):

    def setUp(self):
        self.determinismNotOkFsm = parse("../tests/determinismNotOk.fsml")
        self.idsNotOkFsm = parse("../tests/idsNotOk.fsml")
        self.initialNotOkFsm1 = parse("../tests/initialNotOk1.fsml")
        self.initialNotOkFsm2 = parse("../tests/initialNotOk2.fsml")
        self.reachabilityNotOkFsm = parse("../tests/reachabilityNotOk.fsml")
        self.resolutionNotOkFsm = parse("../tests/resolutionNotOk.fsml")

    def testDeterminism(self):
        self.assertRaises(FsmlDeterministicException, ok, self.determinismNotOkFsm)
    def testDistinctIDs(self):
        self.assertRaises(FsmlDistinctIdsException, ok, self.idsNotOkFsm)
    def testSingleInitial(self):
        self.assertRaises(FsmlSingleInitialException, ok, self.initialNotOkFsm1)
        self.assertRaises(FsmlSingleInitialException, ok, self.initialNotOkFsm2)
    def testReachability(self):
        self.assertRaises(FsmlReachableException, ok, self.reachabilityNotOkFsm)
    def testResolution(self):
        self.assertRaises(FsmlResolvableException, ok, self.resolutionNotOkFsm)

# test cases for the other constraints

class TestOtherConstraints(unittest.TestCase):

    def setUp(self):
        self.syntaxErrorFsm = "../tests/syntaxError.fsml"
        self.correctFsm = parse("../sample.fsml")
        self.illegalEventInput = json.load(open("tests/illegalEvent.input"))
        self.infeasibleEventInput = json.load(open("tests/infeasibleEvent.input"))
    def testSyntaxError(self):
        self.assertRaises(ParseCancellationException, parse, self.syntaxErrorFsm)
    def testIllegalEvent(self):
        self.assertRaises(FsmlIllegalEventException, simulate, self.correctFsm, self.illegalEventInput)
    def testInfeasibleEvent(self):
        self.assertRaises(FsmlInfeasibleEventException, simulate, self.correctFsm, self.infeasibleEventInput)


# tests if the baseline output is the same as the output which is produced by the Simulator.py module
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
        generatedJsonOutput = self.stepper.simulate(self.input)

        # produce the output of the hand-written simulator module
        simulatedJsonOutput = simulate(self.fsm, self.input)

        # assert all 3 types of output are equal
        self.assertEqual(correctJsonOutput, simulatedJsonOutput)
        self.assertEqual(correctJsonOutput, generatedJsonOutput)

if __name__ == '__main__':
    unittest.main()
