/*
Map more complex ESL signature notation to BSL
*/

eslToBsl(Ss1, Ss2) :-
  map(eslToBslSymbol, Ss1, Ss2).

eslToBslSymbol(
  symbol(Sym, Args1, Result),
  (Sym, Args2, Result)
) :-
     map(bslSymbolArg, Args1, Args2).

bslSymbolArg(sort(Sort), Sort). 

