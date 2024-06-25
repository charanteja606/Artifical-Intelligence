% Facts about birds and their ability to fly
% bird(Name, can_fly).
bird(sparrow, can_fly).
bird(penguin, cannot_fly).
bird(eagle, can_fly).
bird(ostrich, cannot_fly).
bird(swallow, can_fly).
bird(kiwi, cannot_fly).

% Predicate to check if a specific bird can fly
can_fly(Bird) :-
    bird(Bird, can_fly).

% Predicate to check if a specific bird cannot fly
cannot_fly(Bird) :-
    bird(Bird, cannot_fly).

% Predicate to list all flying birds
list_flying_birds(FlyingBirds) :-
    findall(Bird, can_fly(Bird), FlyingBirds).

% Predicate to list all non-flying birds
list_non_flying_birds(NonFlyingBirds) :-
    findall(Bird, cannot_fly(Bird), NonFlyingBirds).

% Predicate to print whether a bird can fly or not
print_can_fly(Bird) :-
    can_fly(Bird),
    write(Bird), write(' can fly.'), nl.

print_can_fly(Bird) :-
    cannot_fly(Bird),
    write(Bird), write(' cannot fly.'), nl.
