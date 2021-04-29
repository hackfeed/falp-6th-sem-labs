predicates
    fac(integer, integer).
    facInt(integer, integer, integer).

    fib(integer, integer).
    fibInt(integer, integer, integer, integer).
  
clauses
    facInt(Num, Res, Acc) :- Num > 1, !, TmpNum = Num - 1, TmpAcc = Acc * Num, facInt(TmpNum, Res, TmpAcc).
    facInt(_, Acc, Acc).
    fac(Num, Res) :- facInt(Num, Res, 1).

    fibInt(Num, Res, SPrev, FPrev) :- Num > 2, !, TmpNum = Num - 1, NPrev = SPrev + FPrev, fibInt(TmpNum, Res, FPrev, NPrev).
    fibInt(_, SPrev, SPrev, _).
    fib(Num, Res) :- fibInt(Num, Res, 1, 1).

goal
    fac(5, QRes).
    % fib(5, QRes).
