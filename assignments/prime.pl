% number is divisible by another number
isDivisible(X, Y) :- X mod Y =:= 0.


factors(X, Y) :- 
	N is Y**2,
	N =< X,
	isDivisible(X, Y).


factors(X, Y) :-
	Y < X,
	Y1 is Y + 1,
	factors(X, Y1).
	
	
isPrime(X) :-
	Y is 2,
	X > 1,
	\+ factors(X, Y).


allPrimes(2).
allPrimes(X) :- 
	X > 0,
	Prev is X - 1,
	allPrimes(Prev),
	(isPrime(Prev) -> 
		write(Prev), nl
		;
		write('')
	).
