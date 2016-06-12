# BEGIN ...
from FsmlExceptions import FsmlIllegalEventException, FsmlInfeasibleEventException
# END ...
def simulate(fsm, input):

    input = list(input)
    output = []
    feasibleEvents = set()

    # Determine initial state and feasible events
    for stateName, [stateDeclaration] in fsm.iteritems():
        if stateDeclaration["initial"]:
            currentState = stateDeclaration
        for event, _ in stateDeclaration["transitions"].iteritems():
            feasibleEvents.add(event)

    # Process input
    while input:
        event = input.pop(0)
        if event not in feasibleEvents:
            raise FsmlIllegalEventException
        elif event not in currentState["transitions"]:
            raise FsmlInfeasibleEventException
        else:
            [(action, targetState)] = currentState["transitions"][event]
            if not action == "": output.append(action)
            [currentState] = fsm[targetState]

    return output
