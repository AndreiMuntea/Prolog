submultime([],[]):-!.
submultime([_|T],Res):-submultime(T,Res).
submultime([H|T],[H|Res]):-submultime(T,Res).

puncteColiniare([X1|Y1],[X2|Y2],[X3|Y3]):- (X1*Y2 + X2*Y3 + X3*Y1 - Y2*X3 - Y3*X1 - Y1*X2) =:= 0.

lungime([],0):-!.
lungime([_|T],R):-lungime(T,R1), R is 1 + R1.

toatePuncteleColiniare(S):-lungime(S, R), R is 2,!.
toatePuncteleColiniare([X1,X2,X3|T]):-puncteColiniare(X1,X2,X3),toatePuncteleColiniare([X2,X3|T]).

gaseste(L,Res):-submultime(L,Res), toatePuncteleColiniare(Res).

solve(L,Res):-findall(Lst, gaseste(L,Lst), Res).
