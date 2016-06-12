import pygraphviz

def draw(fsm):
    # Create graph
    graph = pygraphviz.AGraph(title="Sample FSM", directed=True, strict=False, rankdir='LR', nodesep=.5)

    # Create nodes
    for fromState, [stateDeclaration] in fsm.iteritems():
        if stateDeclaration["initial"]:
            graph.add_node(n=fromState, shape='ellipse', style='filled')
        else:
            graph.add_node(n=fromState, shape='ellipse')

    # Create edges
    for fromState, [stateDeclaration] in fsm.iteritems():
        for symbol, [(action, toState)] in stateDeclaration["transitions"].iteritems():
            graph.add_edge(fromState, toState, label=symbol +"/"+action)

    return graph
