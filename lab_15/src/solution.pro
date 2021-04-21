domains
    surname, phoneNumber, city, street = symbol.
    house, flat = unsigned.
    address = address(city, street, house, flat).

    model, color = symbol.
    price, size = unsigned.

    bank = symbol.
    depositId, depositSum = unsigned.

    ownership = 
                building(price, address);
                area(price, size);
                wt(price, color);
                car(price, model, color).

predicates
    hasIdentity(surname, phoneNumber, address).
    hasDeposit(surname, bank, depositId, depositSum).

    own(surname, ownership).
    ownObjects(surname, symbol).
    hasOwnershipNamePrice(surname, symbol, price).
    ownObjectsInner(surname, symbol, price).
    ownObjectsPrice(surname, price).

clauses
    hasIdentity("Alexey", "8 800 555 35 35", address("Krasnogorsk", "Flexa", 14, 88)).
    hasIdentity("Sergey", "8 322 228 14 88", address("Tambov", "Rabochaya", 1, 2)).
    hasIdentity("Pavel", "8 666 555 12 34", address("Toronto", "Tampa", 15, 77)).
    hasIdentity("Feduk", "8 666 555 12 34", address("Toronto", "Tampa", 15, 77)).
    hasIdentity("Dmitriy", "8 666 666 66 66", address("Hell", "Satan", 6, 66)).
    hasIdentity("Mikhail", "8 123 456 78 90", address("Jazz", "Ocean", 7, 7)).
    
    own("Alexey", building(10, address("Krasnogorsk", "Flexa", 14, 88))).
    own("Alexey", car(15, "Velosiped", "White")).
    
    own("Dmitriy", car(1000000, "Nissan", "Beige")).

    own("Feduk", area(5000000, 500)).
    own("Feduk", car(5000000, "Cadillac", "Black")).

    own("Pavel", car(5000000, "Cadillac", "Black")).
    own("Pavel", wt(5000000, "Flexing")).
    own("Pavel", building(500000000, address("Toronto", "Tampa", 15, 77))).
    own("Pavel", area(7777777, 777)).
    
    hasDeposit("Alexey", "Sberbank", 1, 300).
    hasDeposit("Pavel", "Sberbank", 1, 50000).
    hasDeposit("Pavel", "AlphaBank", 2, 50000).
    hasDeposit("Feduk", "Sberbank", 1, 50000).
    hasDeposit("Sergey", "Tinkoff", 1, 200000).
    hasDeposit("Sergey", "Sberbank", 1, 0).
    hasDeposit("Sergey", "Raiffaisen", 3, 30450).
    hasDeposit("Dmitriy", "VTB", 1, 1000000).

    ownObjects(Surname, building) :- own(Surname, building(_, _)).
    ownObjects(Surname, area) :- own(Surname, area(_, _)).
    ownObjects(Surname, wt) :- own(Surname, wt(_, _)).
    ownObjects(Surname, car) :- own(Surname, car(_, _, _)).

    hasOwnershipNamePrice(Surname, building, Price) :- own(Surname, building(Price, _)).
    hasOwnershipNamePrice(Surname, area, Price) :- own(Surname, area(Price, _)).
    hasOwnershipNamePrice(Surname, wt, Price) :- own(Surname, wt(Price, _)).
    hasOwnershipNamePrice(Surname, car, Price) :- own(Surname, car(Price, _, _)).
    
    ownObjectsInner(Surname, building, Price) :- own(Surname, building(Price, _)), !.
    ownObjectsInner(Surname, area, Price) :- own(Surname, area(Price, _)), !.
    ownObjectsInner(Surname, wt, Price) :- own(Surname, wt(Price, _)), !.
    ownObjectsInner(Surname, car, Price) :- own(Surname, car(Price, _, _)), !.
    ownObjectsInner(_, _, 0).
    
    ownObjectsPrice(Surname, Price) :-
                        ownObjectsInner(Surname, building, FPrice),
                        ownObjectsInner(Surname, area, SPrice),
                        ownObjectsInner(Surname, wt, TPrice),
                        ownObjectsInner(Surname, car, FoPrice),
                        Price = FPrice + SPrice + TPrice + FoPrice.

goal
    ownObjects("Alexey", QObject).
    % hasOwnershipNamePrice("Feduk", QObject, QPrice).
    % ownObjectsPrice("Alexey", QPrice).