# BEGIN ...
from FsmlExceptions import FsmlException, FsmlInfeasibleEventException, FsmlIllegalEventException
import json
import sys
# END ...
def run(fsm, input):
    # Determine initial state
    for id, [decl] in fsm.iteritems():
        if decl["initial"]:
            current = decl
            break
    # Consume input; produce output
    output = []
    while input:
        event = input.pop(0)
        if event not in current["transitions"]: raise FsmlInfeasibleEventException
        else:
            [(action, target)] = current["transitions"][event]
            if action is not None: output.append(action)
            if target not in fsm: raise FsmlResolutionException
            [current] = fsm[target]
    return output
# BEGIN ...
def main():
    try:

        # Load FSM and input
        fsm = json.load(open(sys.argv[1], 'r'))
        input = json.load(open(sys.argv[2], "r"))
        input = list(input)
        output = run(fsm, input)
        open(sys.argv[3], 'w').write(json.dumps(output))

    except FsmlException:
        sys.exit(1)
    
if __name__ == '__main__':
    main()
# END ...

