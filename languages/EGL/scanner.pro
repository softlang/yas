% Quoted string literals
eglToken(qstring(Atom)) -->
  char(quote),
  star(not(char(quote)), String),
  char(quote),
  { atom_codes(Atom, String) }.

% Names consisting of alphabetic characters
eglToken(name(Atom)) -->
  plus(char(alpha), String),
  { name(Atom, String) }.

% Keywords and special characters
eglToken(Atom) -->
  {
    member(
      String,
      ["#", "*", "+", "?", "~", "{", "}", "[", "]", ":", ";"]
    ),
    name(Atom, String) 
  },
  String.
