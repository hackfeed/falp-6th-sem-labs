predicates
    fac(integer, integer).
    facInt(integer, integer, integer).

    fib(integer, integer).
    fibInt(integer, integer, integer, integer).
  
clauses
    facInt(Num, Res, Acc) :- Num <= 0, Res = Acc, !.
    facInt(Num, Res, Acc) :- TmpAcc = Acc * Num, TmpNum = Num - 1, facInt(TmpNum, Res, TmpAcc).
    fac(Num, Res) :- facInt(Num, Res, 1).

    fibInt(Num, Res, SPrev, _) :- Num < 2, Res = SPrev, !.
    fibInt(Num, Res, SPrev, FPrev) :- TmpNum = Num - 1, NPrev = SPrev + FPrev, fibInt(TmpNum, Res, FPrev, NPrev).
    fib(Num, Res) :- fibInt(Num, Res, 1, 1).

goal
    fac(5, QRes).
    % fib(5, QRes).
