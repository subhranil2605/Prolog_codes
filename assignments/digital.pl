not(0, 1).
not(1, 0).


or(0, 0, 0).
or(0, 1, 1).
or(1, 0, 1).
or(1, 1, 1).


and(0, 0, 0).
and(0, 1, 0).
and(1, 0, 0).
and(1, 1, 1).


xor(A, B, O) :-
	not(A, NA),
	not(B, NB),
	and(A, NB, K),
	and(NA, B, L),
	or(K, L, O).
	
	
sum(A, B, Cin, O) :-
	xor(A, B, R),
	xor(Cin, R, O).
	

cout(A, B, Cin, O) :-
	xor(A, B, R1),
	and(Cin, R1, R2),
	and(A, B, R3),
	or(R2, R3, O).


% output
:- write("A B C -> sum"), nl.
:- sum(0, 0, 0, X), write('0 0 0 -> '), write(X), nl.
:- sum(0, 0, 1, X), write('0 0 1 -> '), write(X), nl.
:- sum(0, 1, 0, X), write('0 1 0 -> '), write(X), nl.
:- sum(0, 1, 1, X), write('0 1 1 -> '), write(X), nl.
:- sum(1, 0, 0, X), write('1 0 0 -> '), write(X), nl.
:- sum(1, 0, 1, X), write('1 0 1 -> '), write(X), nl.
:- sum(1, 1, 0, X), write('1 1 0 -> '), write(X), nl.
:- sum(1, 1, 1, X), write('1 1 1 -> '), write(X), nl.


:- nl, write("A B C -> C_out"), nl.
:- cout(0, 0, 0, X), write('0 0 0 -> '), write(X), nl.
:- cout(0, 0, 1, X), write('0 0 1 -> '), write(X), nl.
:- cout(0, 1, 0, X), write('0 1 0 -> '), write(X), nl.
:- cout(0, 1, 1, X), write('0 1 1 -> '), write(X), nl.
:- cout(1, 0, 0, X), write('1 0 0 -> '), write(X), nl.
:- cout(1, 0, 1, X), write('1 0 1 -> '), write(X), nl.
:- cout(1, 1, 0, X), write('1 1 0 -> '), write(X), nl.
:- cout(1, 1, 1, X), write('1 1 1 -> '), write(X), nl.