# File _languages/FSML/Python/FsmlVisualizer.py_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Python/FsmlVisualizer.py)**
```
import pygraphviz

def draw(fsm):
    # Create graph
    graph = pygraphviz.AGraph(title="Sample FSM", directed=True, strict=False, rankdir='LR', nodesep=.5)
    # Create nodes
    for fromState, [stateDeclaration] in fsm.iteritems():
...
```
