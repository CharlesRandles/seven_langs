father(charles, william).
father(charles, harry).
father(philip, charles).
father(philip, anne).

mother(diana, william).
mother(diana, harry).
mother(elizabeth, charles).
mother(elizabeth, anne).

parent(X,Y) :- mother(X,Y).
parent(X,Y) :- father(X,Y).

sibling(X,Y) :- parent(P, X), parent(P,Y), \+(X=Y).

partners(X,Y) :- parent(X,Z), parent(Y,Z), \+(X = Y).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
