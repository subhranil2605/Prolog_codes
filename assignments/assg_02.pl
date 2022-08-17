add(X, Y, R) :- R is X + Y.

max(X, Y, X) :- X >= Y.

area_of_square(S, A) :- A is S**2.
perimeter_of_square(S, P) :- P is 4 * S.

area_of_circle(R, A) :- A is  (4 * atan(1)) * R ** 2.
perimeter_of_circle(R, P) :- P is 4 * (4 * atan(1)) * R.

factorial(X, N) :- X > 0, Y is X - 1, factorial(Y, M), N is X * M.

sum_upto_n(X, N) :- X >= 0, Y is X - 1, sum_upto_n(Y, A), N is X + A.