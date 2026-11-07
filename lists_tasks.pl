deleteElement(_, [], []).
deleteElement(X, [X|Tail], Result) :- !,
    deleteElement(X, Tail, Result).
deleteElement(X, [H|Tail], [H|Result]) :-
    deleteElement(X, Tail, Result).

add_at_the_end(X, [], [X]).
add_at_the_end(X, [H|Tail], [H|Result]) :-
    add_at_the_end(X, Tail, Result).

conc([], L, L).
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).

add_at_the_end2(X, List, Result) :-
    conc(List, [X], Result).
