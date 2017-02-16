# BEGIN ...
import json
import sys
from jinja2 import Environment, FileSystemLoader
# END ...
def generateC(fsm):
        # Initialize data structures
        states = set()
        states.add("UNDEFINED")
        events = set()
        actions = set()
        transitions = list()
        # Aggregate data structures
        for source, [statedecl] in fsm.iteritems():
            ts = list()
            transitions.append((source, ts))
            states.add(source)
            if statedecl["initial"]:
                initial = source
            for event, [(action, target)] in statedecl["transitions"].iteritems():
                events.add(event)                    
                if action is not None: actions.add(action)
                ts.append((event, action, target))
        # Look up template
        env = Environment(loader=FileSystemLoader('templates'))
        fsmTemplate = env.get_template('Fsm.c-template')
        # Instantiate template
        return fsmTemplate.render(\
                states = states,\
                initial = initial,\
                events = events,\
                actions = actions,\
                transitions = transitions)
# BEGIN ...
def main():
    fsm = json.load(open(sys.argv[1], 'r'))
    open("generated/"+sys.argv[2]+".c","w").write(generateC(fsm))
    
if __name__ == '__main__':
    main()
# END ...
