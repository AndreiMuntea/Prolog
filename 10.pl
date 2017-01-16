candidat([H|_],H).
candidat([_|T],K):-candidat(T,K).

submultimi(_,N,Suma,Colector,Colector):-mod(Suma, N) =:= 0.
submultimi(L,N,Suma,[H|T],Res):-
	candidat(L,E),
	SumaPrim is Suma + E,
	E > H,
	submultimi(L, N, SumaPrim, [E,H|T],Res).

genereaza(L,N,Res):-
	candidat(L,T),
	submultimi(L,N, T,[T],Res).

solve(L,N,Res):-
	findall(X, genereaza(L,N,X),Res).
