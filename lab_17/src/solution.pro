domains
    num = integer.

predicates
    maxFromTwo(num, num, num)
    maxFromThree(num, num, num, num)
    maxFromTwoCut(num, num, num)
    maxFromThreeCut(num, num, num, num)
  
clauses
    maxFromTwo(Num1, Num2, Num1) :- Num1 >= Num2.
    maxFromTwo(Num1, Num2, Num2) :- Num2 >= Num1.

    maxFromThree(Num1, Num2, Num3, Num1) :- Num1 >= Num2, Num1 >= Num3.
    maxFromThree(Num1, Num2, Num3, Num2) :- Num2 >= Num1, Num2 >= Num3.
    maxFromThree(Num1, Num2, Num3, Num3) :- Num3 >= Num1, Num3 >= Num2.

    maxFromTwoCut(Num1, Num2, Num1) :- Num1 >= Num2, !.
    maxFromTwoCut(_, Num2, Num2).

    maxFromThreeCut(Num1, Num2, Num3, Num1) :- Num1 >= Num2, Num1 >= Num3, !.
    maxFromThreeCut(_, Num2, Num3, Num2) :- Num2 >= Num3, !.
    maxFromThreeCut(_, _, Num3, Num3).

goal
    maxFromTwo(1, 2, QMax).
    % maxFromTwo(2, 1, QMax).
    % maxFromThree(1, 2, 3, QMax).
    % maxFromThree(1, 3, 2, QMax).
    % maxFromThree(3, 1, 2, QMax).
    % maxFromTwoCut(1, 2, QMax).
    % maxFromTwoCut(2, 1, QMax).
    % maxFromThreeCut(1, 2, 3, QMax).
    % maxFromThreeCut(1, 3, 2, QMax).
    % maxFromThreeCut(3, 1, 2, QMax).
