% (Non-negative) integer literals
figureToken(integer(Int)) -->
  plus(char(digit), Digits),
  {  number_codes(Int, Digits) }.

% Keywords and special characters
figureToken(Atom) -->
  {
    member(String,
      [
        "line", "from", "to",
        "circle", "origin", "radius",
        ",", ";", ":", "(", ")"
      ]
    ),
    name(Atom, String) 
  },
  String.
