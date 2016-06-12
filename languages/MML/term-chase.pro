% End of chasing
chaseMembers(_, [], []).

% Chase along "super"
chaseMembers(Classifiers, [Name], Members3) :-
  member(class(_, Name, Super, Members1), Classifiers),
  chaseMembers(Classifiers, Super, Members2),
  append(Members1, Members2, Members3).
