# File _languages/BSL/as.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/as.pro)**
```
% A signature consists of profiles (say, symbol types).
signature(Profiles) :-
  profiles(Profiles).

% Well-formedness of the list (set) of profiles 
profiles(Profiles) :-
  map(symbolOfProfile, Profiles, Symbols),
...
```
