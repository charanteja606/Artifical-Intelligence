% Facts: parent(Parent, Child)
parent(john, mary).
parent(john, paul).
parent(mary, susan).
parent(mary, james).
parent(paul, kate).
parent(paul, tom).
parent(susan, alice).
parent(james, rick).

% Rules:

% X is a child of Y if Y is a parent of X
child(X, Y) :- parent(Y, X).

% X is a sibling of Y if they share a common parent and are not the same person
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% X is a grandparent of Y if X is a parent of Z and Z is a parent of Y
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% X is a grandchild of Y if Y is a grandparent of X
grandchild(X, Y) :- grandparent(Y, X).

% X is an uncle or aunt of Y if X is a sibling of Z and Z is a parent of Y
uncle_aunt(X, Y) :- sibling(X, Z), parent(Z, Y).

% X is an uncle of Y if X is male and X is an uncle or aunt of Y
uncle(X, Y) :- uncle_aunt(X, Y), male(X).

% X is an aunt of Y if X is female and X is an uncle or aunt of Y
aunt(X, Y) :- uncle_aunt(X, Y), female(X).

% X is a cousin of Y if their parents are siblings
cousin(X, Y) :- parent(Z1, X), parent(Z2, Y), sibling(Z1, Z2).

% Gender facts (for uncle and aunt definitions)
male(john).
male(paul).
male(james).
male(tom).
male(rick).

female(mary).
female(susan).
female(kate).
female(alice).

% Query to list all members of the family tree
family_members(Members) :-
    findall(Name, parent(_, Name), Names1),
    findall(Name, parent(Name, _), Names2),
    append(Names1, Names2, AllNames),
    sort(AllNames, Members).
