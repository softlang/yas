# BEGIN ...
from FsmlExceptions import FsmlException, FsmlInfeasibleEventException, FsmlIllegalEventException
import json
import sys
# END ...

def simulate(fsm, input):
    
    # Determine initial state and feasible events
    feasibleEvents = set()
    for stateName, [stateDeclaration] in fsm.iteritems():
        if stateDeclaration["initial"]:
            currentState = stateDeclaration
        for event, _ in stateDeclaration["transitions"].iteritems():
            feasibleEvents.add(event)

    # Consume input; produce output
    output = []
    while input:
        event = input.pop(0)
        if event not in feasibleEvents:
            raise FsmlIllegalEventException
        elif event not in currentState["transitions"]:
            raise FsmlInfeasibleEventException
        else:
            [(action, targetState)] = currentState["transitions"][event]
            if action is not None: output.append(action)
            [currentState] = fsm[targetState]
    return output

def main():
    try:

        # Load FSM and input
        fsm = json.load(open(sys.argv[1], 'r'))
        input = json.load(open(sys.argv[2], "r"))
        input = list(input)
        output = simulate(fsm, input)
        open(sys.argv[3], 'w').write(json.dumps(output))

    except FsmlException:
        sys.exit(1)
    
if __name__ == '__main__':
    main()
