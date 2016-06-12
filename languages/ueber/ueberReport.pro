:- module(ueberReport, []).

report(Ds) :-
  % Languages
  findall(L, member(language(L), Ds), Ls),
  length(Ls, NumLs),  
  format('~w languages.~n', [NumLs]),
  % Files
  findall(F, member(elementOf(F, _), Ds), Fs),
  length(Fs, NumFs),  
  format('~w files.~n', [NumFs]),
  % Membership tests
  findall((MF, ML), member(elementOf(MF, ML), Ds), MFLs),
  length(MFLs, NumMFLs),  
  format('~w membership tests.~n', [NumMFLs]),
  % Functions
  findall((R1, R2, R3, R4, R5), member(function(R1, R2, R3, R4, R5), Ds), Rs),
  length(Rs, NumRs),  
  format('~w functions.~n', [NumRs]),
  % Function applications
  findall((RF, RX, RY), member(mapsTo(RF, RX, RY), Ds), FXYs),
  length(FXYs, NumFXYs),  
  format('~w function applications.~n', [NumFXYs]).
