# BEGIN ...
import os
from jinja2 import Environment, FileSystemLoader
# END ...
def generateC(fsm, file):
        # Initialize data structures
        states = set()
        states.add("UNDEFINED")
        events = set()
        actions = set()
        transitions = list()
        # Aggregate data structures
        for source, [statedecl] in fsm.iteritems():
            ts = list()
            transitions.append((source.upper(), ts))
            states.add(source.upper())
            if statedecl["initial"]:
                initial = source
            for event, [(action, target)] in statedecl["transitions"].iteritems():
                events.add(event.upper())                    
                if action == "": action = "nop"
                actions.add(action)
                ts.append((event.upper(), action, target.upper()))
        # Look up template
        env = Environment(loader=FileSystemLoader('templates'))
        fsmTemplate = env.get_template('Fsm.c-template')
        # Instantiate templates
        fsmFile = fsmTemplate.render(\
                states = states,\
                events = events,\
                actions = actions,\
                transitions = transitions)
        # Persist output
        open("generated/"+file+".c","w").write(fsmFile)
