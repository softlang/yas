% Account for differences in cardinality
recardinalize(
  MM1, % Metamodel of source model 
  MM2, % Metamodel of target model
  M1, % Source model
  M2 % Target model
) :-
     conforms(M1, MM1),
     recardObject(MM1, MM2, M1, M2),
     conforms(M2, MM2).

% Per-object logic
recardObject(MM1, MM2, M1, M2) :-
  lookup(class, M1, ClassN),
  graphToList(M1, L1, Q),
  map(recardMember(MM1, MM2, ClassN), L1, L2),
  apply(Q, [L2, M2]).

% Per-member logic
recardMember(_, _, ClassN, (class, ClassN), (class, ClassN)).
recardMember(MM1, MM2, ClassN, KV1, KV2) :-
  KV1 \= (class,ClassN),
  KV1 = (MemberN, V1),
  lookupMember(ClassN, MemberN, MM1, Member1),
  lookupMember(ClassN, MemberN, MM2, Member2),
  lookup(class, Member1, Kind),
  lookup(class, Member2, Kind),
  lookup(cardinality, Member1, Card1),
  lookup(cardinality, Member2, Card2),
  recardValue(MM1, MM2, Kind, Card1, Card2, V1, V2),
  KV2 = (MemberN, V2).
  
% required to required
recardValue(MM1, MM2, Kind, Card, Card, V1, V2) :-
  lookup(class, Card, one),
  recardValue(MM1, MM2, Kind, V1, V2).

% option to option
recardValue(MM1, MM2, Kind, Card, Card, V1, V2) :-
  lookup(class, Card, option),
  map(recardValue(MM1, MM2, Kind), V1, V2).

% star to star
recardValue(MM1, MM2, Kind, Card, Card, V1, V2) :-
  lookup(class, Card, star),
  map(recardValue(MM1, MM2, Kind), V1, V2).

% required to optional or many
recardValue(MM1, MM2, Kind, Card1, Card2, V1, [V2]) :-
  lookup(class, Card1, one),
  lookup(class, Card2, ClassN),
  member(ClassN, [option, star]),
  recardValue(MM1, MM2, Kind, V1, V2).

% optional or many to required
recardValue(MM1, MM2, Kind, Card1, Card2, V1, V2) :-
  lookup(class, Card1, ClassN),
  member(ClassN, [option, star]),
  lookup(class, Card2, one),
  map(recardValue(MM1, MM2, Kind), V1, [V2]).

% Recurse into parts
recardValue(MM1, MM2, part, M1, M2) :-
  recardObject(MM1, MM2, M1, M2).

% Preserve references, as is
recardValue(_, _, reference, R, R).

% Preserve values, as is
recardValue(_, _, value, V, V).
