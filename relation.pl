female(archana).
female(chaitali).
female(niva).
female(rupali).
female(tripti).

male(vabani).
male(adhir).
male(rabindra).
male(pijush).
male(pritam).
male(roni).
male(pradip).
male(sasanka).
male(rick).
male(ayush).

parent(adhir, vabani).
parent(niva, vabani).
parent(pijush, vabani).
parent(adhir, archana).
parent(niva, archana).
parent(pijush, archana).

parent(pritam, adhir).
parent(roni, adhir).
parent(pritam, chaitali).
parent(roni, chaitali).

parent(pradip, rabindra).
parent(tripti, rabindra).
parent(pradip, niva).
parent(tripti, niva).

parent(rick, pradip).
parent(ayush, pradip).
parent(rick, rupali).
parent(ayush, rupali).



mother(X, Y) :- parent(X, Y), female(Y).
father(X, Y) :- parent(X, Y), male(Y).
sister(X, Y) :- parent(X, Z), parent(Y, Z), female(Y), X \== Y.
brother(X, Y) :- parent(X, Z), parent(Y, Z), male(Y), X \== Y.
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandmother(X, Y) :- parent(X, Z), parent(Z, Y), female(Y).
grandfather(X, Y) :- parent(X, Z), parent(Z, Y), male(Y).
wife(X, Y) :- parent(Z, X), parent(Z, Y), female(Y), male(X).
husband(X, Y) :- parent(Z, X), parent(Z, Y), male(Y), female(X).
uncle(X, Y) :- parent(X, Z), brother(Y, Z), male(Y).
predecessor(X, Z) :- parent(X, Z).
predecessor(X, Z) :- parent(X, Y), predecessor(Y, Z).