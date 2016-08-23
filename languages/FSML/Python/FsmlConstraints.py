# BEGIN ...
from FsmlExceptions import *

# END ...
# The state ids of the state declarations must be distinct.
def distinctStateIds(fsm):
    for state, decls in fsm.iteritems():
        if not len(decls) == 1:
            raise FsmlDistinctIdsException()

# An FSM must have exactly one initial state.
def singleInitialState(fsm):
    initials = [initial for initial, [decl] in fsm.iteritems() if decl["initial"]]
    if not len(initials) == 1:
        raise FsmlSingleInitialException()

# The events must be distinct for each state's transitions.
def deterministicTransitions(fsm):
    for state, [decl] in fsm.iteritems():
        for input, transitions in decl["transitions"].iteritems():
            if not len(transitions) == 1:
                raise FsmlDeterministicException()
    
# The target state of each transition must be declared.
def resolvableTargetStates(fsm):
    for _, [decl] in fsm.iteritems():
        for _, transitions in decl["transitions"].iteritems():
            for (_, target) in transitions:
                if not target in fsm:
                    raise FsmlResolvableException()

# All states must be reachable from the initial state.
def reachableStates(fsm):
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

# Combine all constraints
def ok(fsm):
    for fun in [
            distinctStateIds,
            singleInitialState,
            resolvableTargetStates,
            deterministicTransitions,
            reachableStates]:
        fun(fsm)
