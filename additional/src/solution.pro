domains
    surname, bank = symbol.
    depositId, depositSum = unsigned.
    lst = depositId*. 

predicates
    hasDeposit(surname, bank, depositId, depositSum).

    notExist(depositId, lst).

    collectDepositsInt(surname, lst, lst).
    collectDeposits(surname, lst).

    lstsumByIdInt(lst, surname, depositSum, depositSum).
    lstsumById(lst, surname, depositSum).
    
    sumOfDeposits(surname, depositSum).

clauses
    notExist(H, [H|_]) :- !, fail.
    notExist(Id, [_|T]) :- notExist(Id, T).
    notExist(_, []).

    collectDepositsInt(Surname, Res, Acc) :- 
        hasDeposit(Surname, _, Id, _), notExist(Id, Acc), !, collectDepositsInt(Surname, Res, [Id|Acc]).
    collectDepositsInt(_, Acc, Acc).
    collectDeposits(Surname, Res) :- collectDepositsInt(Surname, Res, []).

    lstsumByIdInt([H|T], Surname, Res, Acc) :- hasDeposit(Surname, _, H, Sum), Tmp = Acc + Sum, !, lstsumByIdInt(T, Surname, Res, Tmp).
    lstsumByIdInt([], _, Acc, Acc).
    lstsumById(Lst, Surname, Res) :- lstsumByIdInt(Lst, Surname, Res, 0).

    sumOfDeposits(Surname, Sum) :-
        collectDeposits(Surname, Res), lstsumById(Res, Surname, Sum).

    hasDeposit("Alexey", "Sberbank", 1, 300).
    hasDeposit("Pavel", "Sberbank", 1, 50000).
    hasDeposit("Pavel", "AlphaBank", 2, 50000).
    hasDeposit("Feduk", "Sberbank", 1, 50000).
    hasDeposit("Sergey", "Tinkoff", 1, 200000).
    hasDeposit("Sergey", "Sberbank", 2, 0).
    hasDeposit("Sergey", "Raiffaisen", 3, 30450).
    hasDeposit("Dmitriy", "VTB", 1, 1000000).

goal
    sumOfDeposits("Sergey", QSum).