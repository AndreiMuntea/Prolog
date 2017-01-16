candidat([H|_],H).
candidat([_|T],K):-candidat(T,K).

elimina([H|T], H, T):-!.
elimina([H|T], K, [H|Res]):-elimina(T,K,Res).

aranjamente(0, _, Sol, Sol).
aranjamente(K, L, Sol, C):-
	candidat(L, T),
	elimina(L, T, LPrim),
	KPrim is K - 1,
	SolPrim = [T|Sol],
	aranjamente(KPrim, LPrim, SolPrim, C).

solve(K,L,R):-
	findall(X, aranjamente(K,L,[],X), R).
