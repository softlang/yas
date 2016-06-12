eq([],[]).
eq([T1|Ts1],[T2|Ts2]) :- T1 =@= T2, eq(Ts1, Ts2).
