# BEGIN ...
from FsmlExceptions import *
# END ...
def ok(fsm):
    for fun in [
            distinctStateIds,
            singleInitialState,
            deterministicTransitions,
            resolvableTargetStates,
            reachableStates ] : fun(fsm)

def distinctStateIds(fsm):
    for state, decls in fsm.iteritems():
        if not len(decls) == 1: raise FsmlDistinctIdsException()

def singleInitialState(fsm):
    initials = [initial for initial, [decl] in fsm.iteritems() if decl["initial"]]
    if not len(initials) == 1: raise FsmlSingleInitialException()

def deterministicTransitions(fsm):
    for state, [decl] in fsm.iteritems():
        for event, transitions in decl["transitions"].iteritems():
            if not len(transitions) == 1: raise FsmlDeterminismException()
    
def resolvableTargetStates(fsm):
    for _, [decl] in fsm.iteritems():
        for _, transitions in decl["transitions"].iteritems():
            for (_, target) in transitions:
                if not target in fsm: raise FsmlResolutionException()

def reachableStates(fsm):
    for initial, [decl] in fsm.iteritems():
        if decl["initial"]:
            reachables = set([initial])
            chaseStates(initial, fsm, reachables)
    if not reachables == set(fsm.keys()): raise FsmlReachabilityException()

# Helper for recursive closure of reachable states 
def chaseStates(source, fsm, states): # ...
# BEGIN ...
    for decl in fsm[source]:
        for _, [(_, target)] in decl["transitions"].iteritems():
            if not target in states:
                states.add(target)
                chaseStates(target, fsm, states)
# END ...
