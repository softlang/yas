# File _languages/Text/textLoc.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Text/textLoc.pro)**
```
% BEGIN ...
:- module(textLoc, []).

% END ...
loc(Chars, LOC) :-
  filter(flip(char_type, newline), Chars, Newlines),
  length(Newlines, LOC).
```
