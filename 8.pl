candidat(_,1).
candidat(_,'X').
candidat(_,2).


rev([],Colector, Colector).
rev([H|T],Colector,Res):-rev(T,[H|Colector],Res).


pronosticGenerate(0,XC,[H|T],Sol):-
	XC =< 2,
	not(H == 2),
	rev([H|T],[],Sol),
	!.
pronosticGenerate(CT,XC,Col,Sol):-
	CT > 0,
	candidat(_,E),
	((E == 'X' -> XCPrim is XC + 1);(XCPrim is XC)),
	XCPrim =< 2,
	ColPrim = [E|Col],
	CTPrim is CT - 1,
	pronosticGenerate(CTPrim, XCPrim, ColPrim, Sol).

pronostic(Res):-
	findall(X,pronosticGenerate(4,0,[],X),Res).
