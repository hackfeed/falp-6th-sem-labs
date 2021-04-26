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
    lstlenInt([], Res, Acc) :- Res = Acc, !.
    lstlenInt([_|T], Res, Acc) :- Tmp = Acc + 1, lstlenInt(T, Res, Tmp).
    lstlen(Lst, Res) :- lstlenInt(Lst, Res, 0).

    lstsumInt([], Res, Acc) :- Res = Acc, !.
    lstsumInt([H|T], Res, Acc) :- Tmp = Acc + H, lstsumInt(T, Res, Tmp).
    lstsum(Lst, Res) :- lstsumInt(Lst, Res, 0).

    lstoddsumInt([], Res, Acc) :- Res = Acc, !.
    lstoddsumInt([_, H|T], Res, Acc) :- Tmp = Acc + H, lstoddsumInt(T, Res, Tmp).
    lstoddsum(Lst, Res) :- lstoddsumInt(Lst, Res, 0).

goal
    lstlen([1, 2], QRes).
    % lstsum([1, 2], QRes).
    % lstoddsum([1, 2], QRes).
