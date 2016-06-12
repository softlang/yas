# BEGIN ...
import os
from jinja2 import Environment, FileSystemLoader
# END ...
def generateCode(fsm):
        actions = set() # Accumulate actions for handler class
        transitions = [] # Accumulate transitions for stepper class
        # Map model to data structure needed for templates
        for fromState, [statedecl] in fsm.iteritems():
            if statedecl["initial"]:
                initialState = fromState
            for input, [(action, toState)] in statedecl["transitions"].iteritems():
                actions.add(action)
                transitions.insert(0,(fromState, input, action, toState))
        # Look up templates
        env = Environment(loader=FileSystemLoader('templates'))
        handlerTemplate = env.get_template('handler.py-template')
        stepperTemplate = env.get_template('stepper.py-template')
        # Instantiate templates according to model
        handlerClass = handlerTemplate.render(\
                            actions=actions)
        stepperClass = stepperTemplate.render(\
                            initialState=initialState,\
                            transitions=transitions)
        # Persist output
        open("generated/Handler.py","w").write(handlerClass)
        open("generated/Stepper.py","w").write(stepperClass)
