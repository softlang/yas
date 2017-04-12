# File _languages/PPL/pplRender.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/PPL/pplRender.pro)**
```
% BEGIN ...
:- module(pplRender, []).
% END ...
% Top-level predicate
render(Box, S) :-
  box(Box, L),
  with_output_to(codes(S), map(pplRender:line, L)).
...
```
