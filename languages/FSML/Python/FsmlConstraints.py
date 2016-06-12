# BEGIN ...
from FsmlExceptions import *
# END ...
# An FSM must have exactly one initial state.
def singleInitial(fsm):
    initials = [initial for initial, [decl] in fsm.iteritems() if decl["initial"]]
    if not len(initials) == 1:
        raise FsmlSingleInitialException()

# The target state of each transition must be declared.
def resolvableTargets(fsm):
    for _, [decl] in fsm.iteritems():
        for _, [(_, target)] in decl["transitions"].iteritems():
            if not target in fsm:
                raise FsmlResolvableException()

# The state ids of the state declarations must be distinct.
def distinctIds(fsm):
    for state, decls in fsm.iteritems():
        if not len(decls) == 1:
            raise FsmlDistinctIdsException()

# All states must be reachable from the initial state.
def reachability(fsm):
    for initial, [decl] in fsm.iteritems():
        if decl["initial"]:
            reachables = set([initial])
            chaseStates(initial, fsm, reachables)
    if not reachables == set(fsm.keys()):
        raise FsmlReachableException()

# Helper for recursive closure of reachable states 
def chaseStates(source, fsm, states):
    for decl in fsm[source]:
        for _, [(_, target)] in decl["transitions"].iteritems():
            if not target in states:
                states.add(target)
                chaseStates(target, fsm, states)

# The events must be distinct for each state's transitions.
def determinism(fsm):
    for state, [decl] in fsm.iteritems():
        for input, transitions in decl["transitions"].iteritems():
            if not len(transitions) == 1:
                raise FsmlDeterministicException()

# Combine all constraints
def ok(fsm):
    for fun in [distinctIds, singleInitial, determinism, resolvableTargets, reachability]:
        fun(fsm)
