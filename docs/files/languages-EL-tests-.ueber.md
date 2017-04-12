# File _languages/EL/tests/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/tests/.ueber)**
```
[
    % EL evaluation
    macro(parseFile('no-vars.el')),  
    elementOf('no-vars.value', term),
    function(evaluate, [el(term)], [term], elEvaluate:evaluate, []),
    mapsTo(evaluate, ['no-vars.term'], ['no-vars.value']),

...
```
