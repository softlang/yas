:- module(rlDerive, []).

% Derive rule-based syntax from term-level syntax
main(Cs1, Ls1, As1,
  [ ([], rules, [star([n(rule)])]) | Cs4 ],
  [ ([], rlvar, [t('$'), n(upper), star([n(alpha)])]) | Ls1 ],
  [ type(rules, star(sort(rule))), symbol(rlvar, [string], rlvar) | As4 ]
) :-
     % Concrete syntax
     labels(Cs1, Ls),
     allNs(Cs1, Ns),
     definedNs(Cs1, DNs),
     \+ member(rules, Ns), 
     \+ member(rlvar, Ns), 
     \+ member(rule, Ns), 
     map(rlDerive:eglRule(Ls), DNs, Cs2),
     map(rlDerive:eglVariable(Ls), DNs, Cs3),
     concat([Cs2, Cs3, Cs1], Cs4),

     % Abstract syntax
     symbols(As, Fs),
     allSs(As1, Ss),
     definedSs(As1, DSs),
     \+ member(rules, Ss), 
     \+ member(rlvar, Ss), 
     \+ member(rule, Ss), 
     map(rlDerive:eslRule(Fs), DSs, As2),
     map(rlDerive:eslVariable(Fs), DSs, As3),
     concat([As2, As3, As1], As4).

% A production for rules per nonterminal
eglRule(Ls, N, ([N], rule, [t(N), t(':'), n(N), t('->'), n(N), t(';')])) :-
  \+ member(N, Ls).

% A production for variables per nonterminal
eglVariable(Ls, N, ([L], N, [n(rlvar)])) :-
  atom_concat('_', N, L),
  \+ member(L, Ls).

% A symbol for rules per sort
eslRule(Fs, S, symbol(S, [sort(S), sort(S)], rule)) :-
  \+ member(N, Fs).

% A symbol for variables per sort
eslVariable(Fs, S, symbol(F, [sort(rlvar)], S)) :-
  atom_concat('_', S, F),
  \+ member(F, Fs).
