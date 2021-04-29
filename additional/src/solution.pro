domains
    surname, bank = symbol.
    depositId, depositSum = unsigned.

predicates
    hasDeposit(surname, bank, depositId, depositSum).

    sumOfDepositsInt(surname, unsigned, unsigned).
    sumOfDeposits(surname, unsigned).

clauses
    sumOfDepositsInt(Surname, Sum, Acc) :- 
        hasDeposit(Surname, _, _, Dep), !, TmpAcc = Acc + Dep, sumOfDepositsInt(Surname, Sum, TmpAcc).
    sumOfDepositsInt(_, Sum, Acc) :- Sum = Acc, !.
    sumOfDeposits(Surname, Sum) :- sumOfDepositsInt(Surname, Sum, 0), !.

    hasDeposit("Alexey", "Sberbank", 1, 300).
    hasDeposit("Pavel", "Sberbank", 1, 50000).
    hasDeposit("Pavel", "AlphaBank", 2, 50000).
    hasDeposit("Feduk", "Sberbank", 1, 50000).
    hasDeposit("Sergey", "Tinkoff", 1, 200000).
    hasDeposit("Sergey", "Sberbank", 1, 0).
    hasDeposit("Sergey", "Raiffaisen", 3, 30450).
    hasDeposit("Dmitriy", "VTB", 1, 1000000).

goal
    sumOfDeposits("Sergey", QSum).