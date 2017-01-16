candidat(N,N).
candidat(N,T):-N > 1, N1 is N-1, candidat(N1,T).

descompunere(N,N,Colector,Colector):-!.
descompunere(N,S,[H|T],Res):-
	H > 1,
	E is H - 1,
	SPrim is S + E,
	SPrim =< N,
	descompunere(N,SPrim,[E,H|T],Res).

rezolva(N,Res):-
	candidat(N,E),
	descompunere(N,E,[E],Res).

solve(N,Res):-
	findall(X,rezolva(N,X),Res).
