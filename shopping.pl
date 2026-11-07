basket([coffee, milk, chocolate, apple, juice]).

conc([], L, L).
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).

display_items([]).
display_items([H|T]) :-
    write(H), nl,
    display_items(T).

start :-
    basket(B),
    menu(B).

menu(Basket) :-
    write('** SHOPPING LIST **'), nl,
    write('d. display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. exit.'), nl,
    write('ENTER YOUR CHOICE .'), nl,
    read(Choice),
    choice(Choice, Basket).

choice(d, Basket) :- !,
    display_items(Basket),
    menu(Basket).

choice(a, Basket) :- !,
    write('enter the item you want to add it'), nl,
    read(Item),
    conc(Basket, [Item], NewBasket),
    write('The item has been added'), nl,
    menu(NewBasket).

choice(e, _) :- !,
    write('Goodbye!'), nl.

choice(_, Basket) :-
    write('Invalid choice, try again.'), nl,
    menu(Basket).
