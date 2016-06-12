% Wellness of metamodels
metamodelOk(Classifiers) :-

  % Uniqueness of classifier names
  map(nameOfClassifier, Classifiers, Names),
  set(Names),

  % Wellness per classifier
  map(classifierOk(Classifiers), Classifiers).

% Projection of classifier to name
nameOfClassifier(class(_, Name, _, _), Name).
nameOfClassifier(datatype(Name), Name).

% Wellness of datatypes (trivial)
classifierOk(_, datatype(_)).

% Wellness of classes
classifierOk(
  Classifiers, % Context
  class(_, _, Extends, Members1))

 :-
    % Resolvability of "super"
    chaseMembers(Classifiers, Extends, Members2),

    % Uniqueness of member names
    append(Members1, Members2, Members3),
    map(nameOfMember, Members3, Names),
    set(Names),

    % Wellness per member 
    map(memberOk(Classifiers), Members1).

% Projection of member to name
nameOfMember((_, Name, _, _), Name).

% Wellness of values
memberOk(Classifiers, (value, _, Name, _)) :-
  member(datatype(Name), Classifiers).

% Wellness of parts
memberOk(Classifiers, (part, _, Name, _)) :-
  member(class(_,Name,_,_), Classifiers).

% Wellness of references
memberOk(Classifiers, (reference, _, Name, _)) :-
  member(class(_,Name,_,_), Classifiers).
