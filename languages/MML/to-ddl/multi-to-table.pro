% Map multi-valued members to tables    
multisToTables(
  class(false, Name, [], Members),
  Tables)
 :-
    map(multiToTable(Name), Members, Tabless),
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
