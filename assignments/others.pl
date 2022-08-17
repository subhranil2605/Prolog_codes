% sum of a range
sumRange(X, Y, Z) :- Y is X+1, Z is X + Y.
sumRange(Start, End, X) :-
    Prev is End - 1,
    sumRange(Start, Prev, R),
    X is R + End.



% divisible
isDivisible(X, Y) :-
    N is Y*Y,
    N =< X,
    X mod Y =:= 0.

isDivisible(X, Y) :-
    Y < X,
    Y1 is Y+1,
    isDivisible(X,Y1).

% prime 
isPrime(X) :-
    Y is 2,
    X > 1, 
    \+ isDivisible(X, Y).


allPrimeUptoN(N) :-
    Prev is N - 1,
    isPrime(Prev),
    allPrimeUptoN(Prev),
    write(Prev), write(', ').