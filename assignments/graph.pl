%  Directed Graph
% 
% 0 --- 1 --- 2
%        \   /
%          3 --- 4 --- 5
% 


% Edges
edge(0, 1).

edge(1, 2).
edge(1, 3).

edge(2, 3).

edge(3, 4).

edge(4, 5).


% Path
path(A, B, [A, B]) :- edge(A, B).
path(A, B, PathAB) :-
    edge(A, C),
    path(C, B, PathCB),
    PathAB = [A | PathCB].


find_paths(A, B) :-
    path(A, B, Path),
    printPath(Path), nl,
    fail.


printPath([]).
printPath([X]) :- !, write(X).
printPath([X|T]) :-
    write(X), write(' -> '),
    printPath(T).