% Subclassing is reflective
subclassOf(_, N, N).

% Subclassing considers super
subclassOf(MM, N1, N2) :-
  N1 \= N2,
  lookupClass(N1, MM, C),
  lookup(super, C, [#Super]),
  getObject(MM, Super, O),
  lookup(name, O, N3),
  subclassOf(MM, N3, N2). 

% Test for specific class
instanceOf(Class, O) :-
  lookup(class, O, Class).

% Test for specific class or subclasses thereof
instanceOf(MM, Class1, O) :-
  lookup(class, O, Class2),
  subclassOf(MM, Class2, Class1).
