% towers_of_hanoi(N, Source, Target, Auxiliary, Moves) succeeds if Moves is the sequence of moves to solve the Towers of Hanoi problem for N disks from Source to Target using Auxiliary as the auxiliary peg.

% Base case: moving 1 disk from Source to Target.
towers_of_hanoi(1, Source, Target, _, [(Source, Target)]) :-
    write('Move disk from '), write(Source), write(' to '), write(Target), nl.

% Recursive case: moving N disks from Source to Target using Auxiliary.
towers_of_hanoi(N, Source, Target, Auxiliary, Moves) :-
    N > 1,
    M is N - 1,
    towers_of_hanoi(M, Source, Auxiliary, Target, Moves1),
    towers_of_hanoi(1, Source, Target, _, Moves2),
    towers_of_hanoi(M, Auxiliary, Target, Source, Moves3),
    append(Moves1, Moves2, TempMoves),
    append(TempMoves, Moves3, Moves).

% Query to solve the Towers of Hanoi problem for N disks.
solve_hanoi(N) :-
    towers_of_hanoi(N, 'A', 'C', 'B', Moves),
    write('Sequence of moves: '), nl,
    print_moves(Moves).

% Helper predicate to print the sequence of moves.
print_moves([]).
print_moves([(Source, Target) | Rest]) :-
    write('Move disk from '), write(Source), write(' to '), write(Target), nl,
    print_moves(Rest).
