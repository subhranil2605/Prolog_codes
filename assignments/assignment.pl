% -------------------------------------------- %
% ------------- SUBHRANIL SARKAR ------------- %
% -------- Roll: 96/DTS No.: 210018 ---------- %
% ------------ M.Sc. DATA SCIENCE ------------ %
% --------------- 2nd SEMESTER --------------- %
% ---------- University of Kalyani ----------- %
% ------------- 18th AUGUST, 2022 ------------ %
% -------------------------------------------- %



% ------------------------------------------- %
% ------------ Prolog Assignments ----------- %
% ------------------------------------------- %



% ------------------ Documentation ------------------ %
% 
% To run each problem.
% 
% ?- [assignment].  % first compile this program.
% ?- problem1.      % to run problem number 1 (and so on).
% 



% --------------------------------------------------------------------------------------------------------------- %


% ============================================================================
% ---------------------------- 1 -------------------------------- %

%                         Family tree
% 
%                              y + z.
%           _____________________|_____________________
%          |                     |                     |
%        a + b.                c + d.               e. + f
%      ____|____                             __________|__________ 
%     |         |                           |          |          |
%     g.        h                           j.         i          k.
% 
% 


%  All the females
female(z).
female(b).
female(d).
female(e).
female(g).
female(j).
female(k).

% All the males
male(y).
male(a).
male(c).
male(f).
male(h).
male(i).

% Parents
parents(y, z, a).
parents(y, z, c).
parents(y, z, e).

parents(a, b, g).
parents(a, b, h).

parents(f, e, i).
parents(f, e, j).
parents(f, e, k).


% _______________________________ Rules _______________________________

mother(Mother, Child) :- parents(_, Mother, Child), female(Mother).

father(Father, Child) :- parents(Father, _, Child), male(Father).

son(Son, Parent) :-
    parents(_, Parent, Son), male(Son);
    parents(Parent, _ , Son), male(Son).
    
daughter(Daughter, Parent) :-
    parents(_, Parent, Daughter), female(Daughter);
    parents(Parent, _ , Daughter), female(Daughter).

brother(Brother, X) :-
    parents(Father, Mother, X),
    parents(Father, Mother, Brother),
    male(Brother),
    Brother \= X.

sister(Sister, X) :-
    parents(Father, Mother, X),
    parents(Father, Mother, Sister),
    female(Sister),
    Sister \= X.

husband(Husband, Wife) :-
    male(Husband), 
    female(Wife),
    parents(Husband, _, Child),
    parents(_, Wife, Child).

wife(Wife, Husband) :-
    male(Husband), 
    female(Wife),
    parents(Husband, _, Child),
    parents(_, Wife, Child).

grandfather(Grandpa, Grandchild) :- 
    male(Grandpa),
    parents(Grandpa,_, Parent),
    parents(Parent,_, Grandchild);
    male(Grandpa),
    parents(Grandpa,_, Parent),
    parents(_,Parent, Grandchild). 

grandmother(Grandma, Grandchild) :- 
    female(Grandma),
    parents(_,Grandma, Parent),
    parents(Parent, _, Grandchild);
    female(Grandma),
    parents(_,Grandma, Parent),
    parents(_,Parent, Grandchild). 

uncle(Uncle, X) :- 
    parents(Parent, _, X), 
    brother(Uncle, Parent), 
    male(Uncle);
    parents(_, Parent, X), 
    brother(Uncle, Parent), 
    male(Uncle).

aunt(Aunt, X) :- 
    parents(Parent, _, X), 
    sister(Aunt, Parent), 
    female(Aunt);
    parents(_, Parent, X), 
    sister(Aunt, Parent), 
    female(Aunt).

cousin(Cousin, X) :-
    uncle(Uncle, X),
    son(Cousin, Uncle);
    uncle(Uncle, X),
    daughter(Cousin, Uncle);
    aunt(Aunt, X),
    son(Cousin, Aunt);
    aunt(Aunt, X),
    daughter(Cousin, Aunt).
    

% Query

problem1 :-
    findall(X, cousin(X, h), Z), write('Cosins of h are: '), write(Z), nl;
    findall(X, brother(X, c), Z), write('Brother(s) of c are: '), write(Z), nl;
    findall(X, sister(X, i), Z), write('Sister(s) of i are: '), write(Z), nl;
    grandfather(X, j), write('Grandfather of j is: '), write(X), nl;
    brother(X, e), \+ father(X, g), write('Brother of e, who is not father of g is: '), write(X), nl.



% ============================================================================
% ---------------------------- 2 -------------------------------- %

% Sum of two numbers

% Rules
sumOfTwo(X, Y, R) :- R is X + Y.


% Query
problem2 :-
    X = 25, Y = 26,
    sumOfTwo(X, Y, R),
    writef('The sum of %d and %d is: %d', [X, Y, R]).



% ============================================================================
% ---------------------------- 3 -------------------------------- %

% Maximum of two numbers

% Rules
maxOfTwo(X, Y, X) :- X >= Y.
maxOfTwo(X, Y, Y) :- Y > X.


% Query
problem3 :- 
    X = 25, Y = 28,
    maxOfTwo(X, Y, R),
    writef('The max of %d and %d is: %d\n', [X, Y, R]),
    maxOfTwo(Y, X, R),
    writef('The max of %d and %d is: %d\n', [Y, X, R]).


% ============================================================================
% ---------------------------- 4 -------------------------------- %

% Area and perimeter of a square

% Rules
areaOfSquare(Side, Area) :- Area is Side**2.
perimeterOfSquare(Side, Perim) :- Perim is 4 * Side.


% Query
problem4 :-
    write('Enter the length of the side of a sqaure (in cm): '),
    read(Side),
    areaOfSquare(Side, A),
    perimeterOfSquare(Side, P),
    writef('The area of the square is: %d cm^2\n', [A]),
    writef('The perimeter of the square is: %d cm', [P]).



% ============================================================================
% ---------------------------- 5 -------------------------------- %

% Area and perimeter of a square

% Rules
areaOfCircle(Radius, Area) :-
    Pi is 4 * atan(1),
    Area is Pi * Radius ** 2.

perimeterOfCircle(Radius, Perim) :- 
    Pi = 4 * atan(1),
    Perim is 2 * Pi * Radius.


% Query
problem5 :-
    write('Enter the radius of the circle (in cm): '),
    read(R),
    areaOfCircle(R, A),
    perimeterOfCircle(R, P),
    writef('The perimeter of the circle is: %d cm\n', [P]),
    writef('The area of the circle is: %d cm^2\n', [A]).



% ============================================================================
% ---------------------------- 6 -------------------------------- %

% Fibonacci Series

% Rules

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
fibSeries(N) :-
    fib(N, W), writef('%d, ', [W]),
    S is N - 1,
    fibSeries(S).


% Query
problem6 :-
    write('Enter an integer: '),
    read(N),
    fibSeries(N).


% ============================================================================
% ---------------------------- 7 -------------------------------- %

% Sum of natural numbers

% Rules
sumOfN(0, 0).
sumOfN(N, S) :- 
    N > 0,
    Prev is N - 1,
    sumOfN(Prev, R),
    S is R + N.


% Query
problem7 :-
    write('Enter an integer: '),
    read(X),
    sumOfN(X, R),
    writef('Sum of first %d natural number is: %d', [X, R]).



% ============================================================================
% ---------------------------- 8 -------------------------------- %

% Sum of a range

% Rules
sumRange(X, Y, Z) :- Y is X + 1, Z is X + Y.
sumRange(Start, End, X) :-
    Prev is End - 1,
    sumRange(Start, Prev, R),
    X is R + End.


% Query
problem8 :-
    write('Start: '), read(S),
    write('End: '), read(E),
    sumRange(S, E, R),
    writef('Sum of range(%d, %d) is: %d', [S, E, R]).



% ============================================================================
% ---------------------------- 9 -------------------------------- %

% Factorial calculation

% Rules
factorial(0, 1).
factorial(N, F) :-
    N > 0,
    Prev is N - 1,
    factorial(Prev, R),
    F is R * N.

% Query
problem9 :- 
    write('Enter the integer to get its factorial: '),
    read(N),
    factorial(N, W), 
    writef('The factorial of %d is %d', [N, W]).


% ============================================================================
% ---------------------------- 10 -------------------------------- %

% Last element of a list

% Rules
lastElement([X], X).
lastElement([_|T], N) :-
    lastElement(T, M),
    N is M.

% Query
problem10 :-
    L = [1, 2, 5, 100],
    lastElement(L, X),
    write('List is: '),
    write(L), nl,
    writef('The last element is: %d', [X]).



% ============================================================================
% ---------------------------- 11 -------------------------------- %

% Length of a list

% Rules
len([], 0).
len([_|T], N) :-
    len(T, M),
    N is M + 1.

% Query
problem11 :-
    L = [105, 252, 545, 1],
    len(L, X),
    write('List is: '),
    write(L), nl,
    writef('The length of the list is: %d', [X]).



% ============================================================================
% ---------------------------- 12 -------------------------------- %

% average of a list elements

% Rules

% average of elements
average([H|T], A):-
    sum([H|T], S),
    len([H|T], L),
    A is S / L.


% Query
problem12 :-
    L = [105, 252, 545, 1],
    average(L, X),
    write('List is: '),
    write(L), nl,
    writef('The average of the list\'s elements is: %d', [X]).



% ============================================================================
% ---------------------------- 13 -------------------------------- %

% max element from the list

% Rules
maxList([H1, H2|T], Max) :- 
    maxOfTwo(H1, H2, H),
    maxList([H|T], Max).
maxList([X], X).


% Query
problem13 :-
    L = [105, 252, 545, 1],
    maxList(L, X),
    write('List is: '),
    write(L), nl,
    writef('The max element is: %d', [X]).




% ============================================================================
% ---------------------------- 14 -------------------------------- %

% Sum of elements in a list

% Rules
sum([], 0).
sum([H|T], N) :-
    sum(T, M),
    N is M + H.

% Query
problem14 :-
    L = [105, 252, 545, 1],
    sum(L, X),
    write('List is: '),
    write(L), nl,
    writef('The sum of elements is: %d', [X]).



% ============================================================================
% ---------------------------- 15 -------------------------------- %

% GCD and LCM

% Rules
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

% Query
problem15 :-
    X is 120, Y is 226,
    L = [28, 12, 42, 72, 92],
    gcd(X, Y, Gcd), lcm(X, Y, Lcm),
    gcdList(L, GcdL), lcmList(L, LcmL),
    writef('GCD of %d and %d is: %d\n', [X, Y, Gcd]),
    writef('LCM of %d and %d is: %d\n', [X, Y, Lcm]),
    write('The list is: '), write(L), nl,
    writef('GCD of the list: %d\n', [GcdL]),
    writef('LCM of the list: %d', [LcmL]).



% ============================================================================
% ---------------------------- 16 -------------------------------- %

% Insert an element in a list at k-th position

% Rules
insertAt([H|L], 0, E, [E, H|L]).
insertAt([H|T], Pos, E, [H|NL]) :-
    M is Pos - 1,
    insertAt(T, M, E, NL).


% Query
problem16 :- 
    L = [1, 23, 4, 67, 52],
    write('The list is: '), write(L), nl,
    write('Insert Position (start with 0): '), read(P),
    write('Enter the value to be inserted: '), read(V),
    insertAt(L, P, V, L1),
    write('Now the list is: '), write(L1).


% ============================================================================
% ---------------------------- 17 -------------------------------- %

% Digital Circuit

% Rules
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


% Query
problem17 :-
    write('A B C -> sum'), nl,
    sum(0, 0, 0, X0), writef('0 0 0 -> %d\n', [X0]),
    sum(0, 0, 1, X1), writef('0 0 1 -> %d\n', [X1]),
    sum(0, 1, 0, X2), writef('0 1 0 -> %d\n', [X2]),
    sum(0, 1, 1, X3), writef('0 1 1 -> %d\n', [X3]),
    sum(1, 0, 0, X4), writef('1 0 0 -> %d\n', [X4]),
    sum(1, 0, 1, X5), writef('1 0 1 -> %d\n', [X5]),
    sum(1, 1, 0, X6), writef('1 1 0 -> %d\n', [X6]),
    sum(1, 1, 1, X7), writef('1 1 1 -> %d\n\n', [X7]),
    write('A B C -> C_out'), nl,
    cout(0, 0, 0, Y0), writef('0 0 0 -> %d\n', [Y0]),
    cout(0, 0, 1, Y1), writef('0 0 1 -> %d\n', [Y1]),
    cout(0, 1, 0, Y2), writef('0 1 0 -> %d\n', [Y2]),
    cout(0, 1, 1, Y3), writef('0 1 1 -> %d\n', [Y3]),
    cout(1, 0, 0, Y4), writef('1 0 0 -> %d\n', [Y4]),
    cout(1, 0, 1, Y5), writef('1 0 1 -> %d\n', [Y5]),
    cout(1, 1, 0, Y6), writef('1 1 0 -> %d\n', [Y6]),
    cout(1, 1, 1, Y7), writef('1 1 1 -> %d\n\n', [Y7]).


% ============================================================================
% ---------------------------- 18 -------------------------------- %

% Reverse of a given list

% Rules

reverseList([], []).
reverseList([H|T], R) :-
    reverseList(T, L1),
    concat(L1, [H], R).


% Query
problem18 :- 
    L = [1, 23, 4, 67, 52],
    write('The list is: '), write(L), nl,
    reverseList(L, L1),
    write('Reverse of the list is: '), write(L1).



% ============================================================================
% ---------------------------- 19 -------------------------------- %

% Concatenate two lists

% Rules

concat([], L, L).
concat([H|T], L2, [H|L]) :-
    concat(T, L2, L).


% Query
problem19 :- 
    L1 = [1, 24, 52],
    L2 = [4110, 90],
    concat(L1, L2, L),
    write('The first list is: '), write(L1), nl,
    write('The second list is: '), write(L2), nl,
    write('After concatenation the list is: '), write(L).



% ============================================================================
% ---------------------------- 20 -------------------------------- %

% Union, Difference and Intersection

% Rules

% is member
isMember(X, [X|_]).
isMember(X, [_|T]) :- isMember(X, T).


% union
union([], L, L).
union([H|T], L2, L) :- isMember(H, L2), union(T, L2, L).
union([H|T], L2, [H|L]) :- \+ isMember(H, L2), union(T, L2, L).


% intersection
intersection([], _, []).
intersection([X|Y], M, [X|Z]) :- 
    isMember(X, M), 
    intersection(Y, M, Z).
intersection([X|Y], M, Z) :-
    \+ isMember(X, M),
    intersection(Y, M, Z).


% difference
difference([], _, []).
difference([X|Y], M, [X|Z]) :- 
    \+ isMember(X, M), 
    difference(Y, M, Z).
difference([X|Y], M, Z) :-
    isMember(X, M),
    difference(Y, M, Z).



% Query
problem20 :- 
    L1 = [1, 24, 52, 3, 4],
    L2 = [3, 4110, 4, 90],
    union(L1, L2, U),
    intersection(L1, L2, I),
    difference(L1, L2, D),
    write('The first list is: '), write(L1), nl,
    write('The second list is: '), write(L2), nl,
    write('Union: '), write(U), nl,
    write('Intersection: '), write(I), nl,
    write('Difference: '), write(D), nl.



% ============================================================================
% ---------------------------- 21 -------------------------------- %

% Check paildrome

% Rules
isPalidrome([H|T]) :- reverseList([H|T], [H|T]).


% Query
problem21 :- 
    L1 = [1, 24, 52, 3, 4],
    L2 = [3, 4, 5, 4, 3],
    write('The first list is: '), write(L1), nl,
    write('The second list is: '), write(L2), nl,
    (isPalidrome(L1) -> 
		write('The first list is palidrome.'), nl
		;
		write('The first list is not palidrome.'), nl
	),
    (isPalidrome(L2) -> 
		write('The second list is palidrome.'), nl
		;
		write('The second list is not palidrome.'), nl
	).



% ============================================================================
% ---------------------------- 22 -------------------------------- %

% Prime or not.

% Rules

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


% Query
problem22 :-
    write('Enter an integer: '), read(X),
    (isPrime(X) -> 
		writef('The number %d is prime.\n', [X])
		;
		writef('The number %d is not prime.\n', [X])
	),
    write('Enter an integer to get all the prime numbers upto that: '), read(N),
    allPrimes(N).



% ============================================================================
% ---------------------------- 23 -------------------------------- %

% Reverse of a list

% already done in problem 18




% ============================================================================
% ---------------------------- 24 -------------------------------- %

% Delete k-th element from the list

% Rules
deleteAt([_|L], 0, L).
deleteAt([H|T], Pos, [H|X]) :- 
    M is Pos - 1,
    deleteAt(T, M, X).


% Query
problem24 :- 
    L = [1, 23, 4, 67, 52],
    write('The list is: '), write(L), nl,
    write('Delete Position (start with 0): '), read(P),
    deleteAt(L, P, L1),
    write('Now the list is: '), write(L1).



% ============================================================================
% ---------------------------- 25 -------------------------------- %

% Graph Problem

% Rules

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

    

findPaths(A, B) :-
    path(A, B, Path),
    printPath(Path), nl,
    fail.


printPath([]).
printPath([X]) :- !, write(X).
printPath([X|T]) :-
    write(X), write(' -> '),
    printPath(T).


% Query
problem25 :- 
    write('Start Node: '), read(S),
    write('Goal Node: '), read(G),
    (path(S, G, X) -> 
		writef('The paths are\n'), findPaths(S, G)
		;
		writef('There is no path between %d and %d.\n', [S, G])
	).
