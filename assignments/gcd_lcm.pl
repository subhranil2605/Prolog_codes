gcd(X, X, X).
gcd(X, Y, Z) :-
	X > Y, 
	P is X - Y,
	gcd(P, Y, Z).
	
gcd(X, Y, Z) :-
	X < Y, 
	P is Y - X,
	gcd(X, P, Z).
	

lcm(X, Y, Z) :-
	gcd(X, Y, K),
	L is X * Y,
	Z is L / K. 
	

gcdList([H], H).
gcdList([H1, H2|T], R) :-
	gcd(H1, H2, K),
	gcdList([K|T], R).
	

lcmList([H], H).
lcmList([H1, H2|T], R) :-
	lcm(H1, H2, K),
	lcmList([K|T], R).
