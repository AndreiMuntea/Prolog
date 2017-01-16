candidat(N,N).
candidat(N,T):- N > 1, N1 is N - 1, candidat(N1,T).


absolut(N, N):-N >= 0,!.
absolut(N, R):-N < 0, R is 0 - N.

exista(K,[K|_]):-!.
exista(K,[_|T]):-exista(K,T).


generare(_, _, Res, Res).
generare(N, M, [H|T], Res):-
	candidat(N,E),
	not(exista(E,[H|T])),
	Diff is E - H,
	absolut(Diff, Ab),
	Ab >= M,
	generare(N, M, [E,H|T], Res).

gaseste(N,M,Res):-
	candidat(N,T),
	generare(N,M,[T],Res).

solve(N,M,Res):-
	findall(X,gaseste(N,M,X),Res).

