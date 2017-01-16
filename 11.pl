candidat(_,-1).
candidat(_,0).
candidat(_,1).

absolut(X,-X):-X < 0.
absolut(X,X):-X >= 0.

genereaza(0,[H1,H2|T],[H1,H2|T]):-
	H1 == 0,
	Diff is H2 - H1,
	absolut(Diff,Ab),
	not(Ab == 0).
genereaza(N,[H|T],Res):-
	N > 0,
	candidat(_,E),
	Diff is E - H,
	absolut(Diff,Ab),
	not(Ab == 0),
	NPrim is N - 1,
	genereaza(NPrim, [E,H|T],Res).

solve(N,Res):-
	NPrim is N * 2,
	findall(X, genereaza(NPrim, [0], X), Res).
