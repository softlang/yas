% BEGIN ...
:- module(bglToBsl, []).

% END ...
% Convert a grammar to a signature
Rules => Profiles :- map(bglToBsl:(=>), Rules, Profiles).

% Convert a rule to a profile
(Label, Lhs, Rhs) => (Label, Args, Lhs) :- Rhs => Args.

% Base case
[] => [].

% Terminals are not represented by the signature
[t(_)|Rhs] => Args :- Rhs => Args.

% RHS nonterminals are mapped to argument sorts
[n(Sort)|Rhs] => [Sort|Args] :- Rhs => Args.
