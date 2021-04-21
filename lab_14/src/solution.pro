domains
    surname, phoneNumber, city, street = symbol.
    house, flat = unsigned.
    address = address(city, street, house, flat).
    
    carModel, carColor = symbol.
    carPrice = unsigned.
    
    bank = symbol.
    depositId, depositSum = unsigned.

predicates
    hasIdentity(surname, phoneNumber, address).
    hasCar(surname, city, carModel, carColor, carPrice).
    hasDeposit(surname, city, bank, depositId, depositSum).

    infoByCar(carModel, carColor, surname, city, phoneNumber, bank).

clauses
    hasIdentity("Alexey", "8 800 555 35 35", address("Krasnogorsk", "Flexa", 14, 88)).
    hasIdentity("Sergey", "8 322 228 14 88", address("Tambov", "Rabochaya", 1, 2)).
    hasIdentity("Pavel", "8 666 555 12 34", address("Toronto", "Tampa", 15, 77)).
    hasIdentity("Feduk", "8 666 555 12 34", address("Toronto", "Tampa", 15, 77)).
    hasIdentity("Dmitriy", "8 666 666 66 66", address("Hell", "Satan", 6, 66)).
    hasIdentity("Mikhail", "8 123 456 78 90", address("Jazz", "Ocean", 7, 7)).

    hasCar("Sergey", "Tambov", "Velosiped", "Red", 40).
    hasCar("Dmitriy", "Hell", "Nissan", "Beige", 1000000).
    hasCar("Pavel", "Toronto", "Cadillac", "Black", 5000000).
    hasCar("Feduk", "Toronto", "Cadillac", "Black", 5000000).
    hasCar("Mikhail", "Moscow", "Carsharing", "white", 100).
    hasCar("Mikhail", "Moscow", "Carsharing", "blue", 100).

    hasDeposit("Alexey", "Moscow", "Sberbank", 1, 300).
    hasDeposit("Pavel", "Toronto", "Sberbank", 1, 50000).
    hasDeposit("Pavel", "Moscow", "AlphaBank", 2, 50000).
    hasDeposit("Feduk", "Toronto", "Sberbank", 1, 50000).
    hasDeposit("Sergey", "Moscow", "Tinkoff", 1, 200000).
    hasDeposit("Sergey", "Moscow", "Sberbank", 1, 0).
    hasDeposit("Sergey", "Moscow", "Raiffaisen", 3, 30450).
    hasDeposit("Dmitriy", "Hell", "VTB", 1, 1000000).

    infoByCar(CarModel, CarColor, Surname, City, PhoneNumber, Bank) :-
        hasCar(Surname, City, CarModel, CarColor, _),
        hasIdentity(Surname, PhoneNumber, address(City, _, _, _)),
        hasDeposit(Surname, City, Bank, _, _).

goal
    infoByCar("Velosiped", "White", QSurname, QCity, QPhoneNumber, QBank).
    % infoByCar("Nissan", "Beige", QSurname, QCity, QPhoneNumber, QBank).
    % infoByCar("Cadillac", "Black", QSurname, QCity, QPhoneNumber, QBank).