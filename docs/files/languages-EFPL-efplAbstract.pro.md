# File _languages/EFPL/efplAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL/efplAbstract.pro)**
```
% BEGIN ...
:- module(efplAbstract, []).
% END ...
% Mapping for functions
(function, ([], (N, NS, E))) ~> (N, [], NS, E).  
(function, ([(N, T)], (N, NS, E))) ~> (N, [T], NS, E).
      
...
```
