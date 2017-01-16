candidat([H|_],H).
candidat([_|T],K):-candidat(T,K).


subsir(_,L,L).
subsir(S,[H|T],Res):-
	candidat(S,E),
	E < H,
	subsir(S,[E,H|T],Res).


gaseste(S,Res):-
	candidat(S,E),
	subsir(S,[E],Res).

solve(S,Res):-
	findall(X,gaseste(S,X),Res).
