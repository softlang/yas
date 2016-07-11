:- module(mmlToDdl, []).

% Map classes to tables
classesToTables(Classifiers, Tables3) :-
  map(mmlToDdl:classToTable, Classifiers, Tabless1),
  concat(Tabless1, Tables1),
  map(mmlToDdl:multisToTables, Classifiers, Tabless2),
  concat(Tabless2, Tables2),
  append(Tables1, Tables2, Tables3).

% Map each class to a table
classToTable(

  class(
    false, % Map concrete classes, only
    Name, 
    [], % Map non-extended classes, only
    Members),

  [ (Name,
     [ PrimaryKey % Standard column for primary key
     | Columns % Columns for single-valued members
     ] ) ] )

 :-
    PrimaryKey = (
        objectId, % Standardized name of column
        integer, % Standardized primary key type
        [notNull, primaryKey] % SQL DDL modifiers
      ),
    map(mmlToDdl:singleToColumn, Members, Columnss),
    concat(Columnss, Columns).

% Skip datatypes
classToTable(datatype(_), []).

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

% Map multi-valued members to tables    
multisToTables(
  class(false, Name, [], Members),
  Tables)
 :-
    map(mmlToDdl:multiToTable(Name), Members, Tabless),
    concat(Tabless, Tables).

% Skip datatypes
multisToTables(datatype(_), []).

% Map multi-valued member to a designated table
multiToTable(
  Class, % Class containing the multi-valued member
  (Kind, Member, Type, star), % The multi-valued member
  [(Table, [From, To])]) % The relationship table
 :-
    atom_concat([Class, '_', Member], Table),
    downcase_atom(Class, LowerCase),
    atom_concat([LowerCase, 'Id'], Column),
    From = (
        Column, % Synthesized column name
        integer, % Type for SQL keys
        [notNull, foreignKey(Class, objectId)]
      ),
    singleToColumn((Kind, Member, Type, one), [To]).

% Skip single-valued attribute here
multiToTable(_, (_, _, _, Cardinality), []) :-
  member(Cardinality, [one, option]).
