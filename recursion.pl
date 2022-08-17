factorial(0, 1).
factorial(N, F) :-
    N > 0,
    Prev is N - 1,
    factorial(Prev, R),
    F is R * N.

:- factorial(10, W), write('The factorial of 10 is '), write(W).


% Sum of first n natural numbers
sum_of_n(0, 0).
sum_of_n(N, S) :- 
    N > 0,
    Prev is N - 1,
    sum_of_n(Prev, R),
    S is R + N.


% fibonacci 
fib(0, 0).
fib(1, 1).
fib(N, F) :-
    N > 1,
    Prev is N - 1,
    Prevv is N - 2,
    fib(Prev, R1),
    fib(Prevv, R2),
    F is R1 + R2.


% series
fib_series(N) :-
    fib(N, W), write(W), write(', '),
    S is N - 1,
    fib_series(S).