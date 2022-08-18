% list

% length of the list
len([], 0).
len([_|T], N) :-
    len(T, M),
    N is M + 1.


% last element of a list
last_element([X], X).
last_element([_|T], N) :-
    last_element(T, M),
    N is M.


list([H|T], [H|T]).
:- list([1, 2, 34, 56, 78], L),
    last_element(L, W),
    write('The last element of '),
    write(L),
    write(' is '),
    write(W).


% sum of all numbers in a list
sum([], 0).
sum([H|T], N) :-
    sum(T, M),
    N is M + H.


% average of numbers in a list
average([H|T], A):-
    sum([H|T], S),
    len([H|T], L),
    A is S / L.


max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- X < Y.

% max number in list

maxList([H1, H2|T], M) :- 
    max(H1, H2, H),
    maxList([H|T], M).
maxList([X], X).


maxL([], 0).
maxL([H|T], M) :-
    maxL(T, N),
    max(N, H, B),
    M is B.


% concatenation
concat([], L, L).
concat([H|T], L2, [H|L]) :-
    concat(T, L2, L).


% reverse of a list
reverseList([], []).
reverseList([H|T], R) :-
    reverseList(T, L1),
    concat(L1, [H], R).


% palidrome list
isPalidrome([H|T]) :- reverseList([H|T], [H|T]).


% element at the k-th position
element_at([X|_], 0, X).
element_at([_|T], P, X) :-
    M is P - 1,
    element_at(T, M, X).


 % insert at the k-th position
insert_at([_|L], 0, E, [E|L]).
insert_at([H|T], Pos, E, [H|NL]) :-
    M is Pos - 1,
    insert_at(T, M, E, NL).


% delete from the k-th position
delete_at([_|L], 0, L).
delete_at([H|T], Pos, [H|X]) :- 
    M is Pos - 1,
    delete_at(T, M, X).



% is member
is_member(X, [X|_]).
is_member(X, [_|T]) :- is_member(X, T).


% union
union([], L, L).
union([H|T], L2, L) :- is_member(H, L2), union(T, L2, L).
union([H|T], L2, [H|L]) :- \+ is_member(H, L2), union(T, L2, L).


% intersection
intersection([], _, []).
intersection([X|Y], M, [X|Z]) :- 
    is_member(X, M), 
    intersection(Y, M, Z).
intersection([X|Y], M, Z) :-
    \+ is_member(X, M),
    intersection(Y, M, Z).


% difference
difference([], _, []).
difference([X|Y], M, [X|Z]) :- 
    \+ is_member(X, M), 
    difference(Y, M, Z).
difference([X|Y], M, Z) :-
    is_member(X, M),
    difference(Y, M, Z).
