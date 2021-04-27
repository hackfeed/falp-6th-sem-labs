domains
    lst = integer*.

predicates
    formGreater(lst, integer, lst).
    formOdd(lst, lst).
    delElAll(lst, integer, lst).
    delElOne(lst, integer, lst).
    formSet(lst, lst).
  
clauses
    formGreater([H|T], Num, [H|Res]) :- H > Num, formGreater(T, Num, Res), !.
    formGreater([_|T], Num, Res) :- formGreater(T, Num, Res), !.
    formGreater([], _, []) :- !.

    formOdd([_, H|T], [H|Res]) :- formOdd(T, Res), !.
    formOdd([], []) :- !.

    delElAll([H|T], Num, [H|Res]) :- H <> Num, delElAll(T, Num, Res), !.
    delElAll([_|T], Num, Res) :- delElAll(T, Num, Res), !.
    delElAll([], _, []) :- !.

    delElOne([H|T], Num, T) :- H = Num, !.
    delElOne([H|T], Num, [H|Res]) :- delElOne(T, Num, Res), !.
    delElOne([], _, []) :- !.

    formSet([H|T], [H|Res]) :- delElAll(T, H, Tmp), formSet(Tmp, Res), !.
    formSet([], []) :- !.

goal
    formGreater([1, 2, 3, 4, 5, 6, 7], 3, QRes).
    % formOdd([1, 2, 3, 4, 5, 6], QRes).
    % delElAll([1, 2, 3, 4, 5, 5, 6, 5, 5, 5], 5, QRes).
    % delElOne([1, 2, 3, 4, 5, 5, 6, 5, 5, 5], 5, QRes).
    % formSet([1, 2, 3, 4, 5, 5, 6, 5, 5, 5], QRes).

