% Replace an atom by a reference
atomToRef(
    ( CFrom, % Referring class
      CTo, % Referred class
      KFrom, % Key on referring class
      KTo ), % Key on referred class
    M1, % Input model
    MM1, % Input metamodel
    M2, % Output model
    MM2 % Output metamodel
  )

 :-
    % Precondition(s)
    once(conforms(M1, MM1)),

    % Metamodel level
    once(atomToRefMM(CFrom, CTo, KFrom, MM1, MM2)),

    % Model level
    ZFrom = instanceOf(MM1, CFrom),
    ZTo = instanceOf(MM1, CTo),
    once(atomToRefM(ZFrom, ZTo, KFrom, KTo, M1, M2)),

    % Postcondition(s)
    once(conforms(M2, MM2)).
