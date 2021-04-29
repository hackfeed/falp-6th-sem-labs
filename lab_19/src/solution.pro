domains
    lst = integer*.

predicates
    lstlen(lst, integer).
    lstlenInt(lst, integer, integer).

    lstsum(lst, integer).
    lstsumInt(lst, integer, integer).

    lstoddsum(lst, integer).
    lstoddsumInt(lst, integer, integer).
  
clauses
    lstlenInt([_|T], Res, Acc) :- Tmp = Acc + 1, !, lstlenInt(T, Res, Tmp).
    lstlenInt([], Acc, Acc).
    lstlen(Lst, Res) :- lstlenInt(Lst, Res, 0).

    lstsumInt([H|T], Res, Acc) :- Tmp = Acc + H, !, lstsumInt(T, Res, Tmp).
    lstsumInt([], Acc, Acc).
    lstsum(Lst, Res) :- lstsumInt(Lst, Res, 0).

    lstoddsumInt([_, H|T], Res, Acc) :- Tmp = Acc + H, !, lstoddsumInt(T, Res, Tmp).
    lstoddsumInt([], Acc, Acc).
    lstoddsum(Lst, Res) :- lstoddsumInt(Lst, Res, 0).

goal
    lstlen([1, 2], QRes).
    % lstsum([1, 2], QRes).
    % lstoddsum([1, 2], QRes).
