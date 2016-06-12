fxy(Fun,FX,LX,FY,LY) :-
  ueber([
    elementOf(FX, LX),
    elementOf(FY, LY),
    mapsTo(Fun, [FX], [FY]) ]).
