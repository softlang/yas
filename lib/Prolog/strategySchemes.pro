fulltd(S,X,Y) :- sequ(S, all(fulltd(S)), X, Y).
fullbu(S,X,Y) :- sequ(all(fullbu(S)), S, X, Y).
stoptd(S,X,Y) :- choice(S, all(stoptd(S)), X, Y).
oncetd(S,X,Y) :- choice(S, one(oncetd(S)), X, Y).
oncebu(S,X,Y) :- choice(one(oncebu(S)), S, X, Y).
innermost(S,X,Y) :- repeat(oncebu(S),X,Y).
