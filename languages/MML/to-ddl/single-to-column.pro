% Map value members
singleToColumn(
  (value, Name, Type, Cardinality),
  [(Name, SqlType, Clauses)])
 :-
    singleCardinality(Cardinality, Clauses),
    datatypeToSql(Type, SqlType).

% Map non-value members
singleToColumn(
  (Kind, Name, Type, Cardinality),
  [(Name, integer, Clauses2)])
 :-
    member(Kind, [part, reference]),
    singleCardinality(Cardinality, Clauses1),
    append(Clauses1, [foreignKey(Type, objectId)], Clauses2).

% Skip star cardinality here
singleToColumn((_, _, _, star), []).

% NOT NULL for cardinality "one"
singleCardinality(one, [notNull]).

% no NOT NULL for cardinality "option"
singleCardinality(option, []).

% Map String (atom) to VARCHAR(42)
datatypeToSql(atom, varchar(42)).

% Map integer to INTEGER
datatypeToSql(integer, integer).
