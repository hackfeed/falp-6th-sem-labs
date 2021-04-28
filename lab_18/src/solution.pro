predicates
    fac(integer, integer).
    facInt(integer, integer, integer).

    fib(integer, integer).
    fibInt(integer, integer, integer, integer).
  
clauses
    facInt(Num, Res, Acc) :- N > 1, !, TmpNum = Num - 1, TmpAcc = Acc * Num, facInt(TmpNum, Res, TmpAcc).
    facInt(_, Res, Acc) :- Res = Acc, !.
    fac(Num, Res) :- facInt(Num, Res, 1), !.

    fibInt(Num, Res, SPrev, FPrev) :- Num > 2, !, TmpNum = Num - 1, NPrev = SPrev + FPrev, fibInt(TmpNum, Res, FPrev, NPrev).
    fibInt(_, Res, SPrev, _) :- Res = SPrev, !.
    fib(Num, Res) :- fibInt(Num, Res, 1, 1), !.

goal
    fac(5, QRes).
    % fib(5, QRes).
