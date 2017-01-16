submultime([], [], 0).
submultime([_|T], Res, N):-submultime(T,Res,N).
submultime([H|T], [H|Res], N):- N > 0, N1 is N - 1, submultime(T,Res,N1).

