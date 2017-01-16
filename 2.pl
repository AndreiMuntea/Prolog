candidat([H|_],H).
candidat([_|T],K):-candidat(T,K).


ePrimWP(T,D):-T>1, div(T,2) < D, !.
ePrimWP(T,D):-T>1, mod(T,D) =\= 0, D1 is D + 1, ePrimWP(T,D1).

ePrim(T):-ePrimWP(T,2).


listaPrime(0,[]):-!.
listaPrime(N,[N|L]):- ePrim(N),
	              N1 is N - 1,
		      listaPrime(N1,L),
		      !.
listaPrime(N,L):-N1 is N-1,
	         listaPrime(N1,L).


genereaza(N,N,_,Res,Res):-!.
genereaza(N,S,L,[H|T],Res):-
       N > S,
       candidat(L,E),
       E > H,
       S1 is S + E,
       genereaza(N,S1,L,[E,H|T],Res).

gaseste(N,Res):-
	listaPrime(N,Prime),
	candidat(Prime,E),
	genereaza(N,E,Prime,[E], Res).

solve(N,Res):-
	findall(X,gaseste(N,X),Res).

