female(z).
female(b).
female(d).
female(e).
female(g).
female(j).
female(k).

male(y).
male(a).
male(c).
male(f).
male(h).
male(i).


parents(y, z, a).
parents(y, z, c).
parents(y, z, e).

parents(a, b, g).
parents(a, b, h).

parents(f, e, i).
parents(f, e, j).
parents(f, e, k).



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
    

% query 1
:- findall(X, cousin(X, h), Z), write('Cosins of h are: '), write(Z), nl.

% query 2
:- findall(X, brother(X, c), Z), write('Brother(s) of c are: '), write(Z), nl.

% query 3
:- findall(X, sister(X, i), Z), write('Sister(s) of i are: '), write(Z), nl.

% query 4
:- grandfather(X, j), write('Grandfather of j is: '), write(X), nl.

% query 5
:- brother(X, e), \+ father(X, g), write('Brother of e, who is not father of g is: '), write(X), nl.