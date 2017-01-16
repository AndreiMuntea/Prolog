candidat([H|_],H).
candidat([_|T],K):-candidat(T,K).

exista([H|_],H):-!.
exista([_|T],K):-candidat(T,K).

munte(_,-1,Colector,Colector).
munte(L,1,[H|T],Res):-
	candidat(L,E),
	not(exista([H|T],E)),
	((E > H-> Directie is 1);(E < H -> Directie is -1)),
	munte(L,Directie,[E,H|T],Res).
munte(L,-1,[H|T],Res):-
	candidat(L,E),
	not(exista([H|T],E)),
	E < H,
	munte(L,-1,[E,H|T],Res).

rezolva(L,Res):-
	candidat(L,E1),
	candidat(L,E2),
	E2 > E1,
	munte(L,1,[E2,E1],Res).
solve(L,Res):-
	findall(X, rezolva(L,X), Res).
