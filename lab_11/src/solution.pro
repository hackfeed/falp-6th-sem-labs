domains
    name, phoneNumber = symbol.

predicates
    usingNumber(name, phoneNumber).

clauses
    usingNumber("Alexey", "8 800 555 35 35").
    usingNumber("Sergey", "8 322 228 14 88").
    usingNumber("Pavel", "8 666 555 12 34").
    usingNumber("Dmitriy", "8 666 666 66 66").
    usingNumber("Mikhail", "8 123 456 78 90").

goal
    usingNumber(Name, "8 800 555 35 35").
    % usingNumber(Name, "8 800 555 35 36").
    % usingNumber("Alexey", "8 800 555 35 35").
    % usingNumber("Sergey", "8 800 555 35 35").
    % usingNumber("Sergey", PhoneNumber).
    % usingNumber("Sergey", _).
