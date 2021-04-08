domains
    surname, phoneNumber, city, street = symbol.
    house, flat = unsigned.
    address = address(city, street, house, flat).
    
    carModel, carColor = symbol.
    carPrice = unsigned.
    
    bank = symbol.
    depositSum = unsigned.

predicates
    hasIdentity(surname, phoneNumber, address).
    hasCar(surname, carModel, carColor, carPrice).
    hasDeposit(surname, bank, depositSum).

    carByOwnerPhone(phoneNumber, surname, carModel, carPrice).
    carModelByOwnerPhone(phoneNumber, carModel).
    bankAndStreetBySurnameAndCity(surname, city, bank, street).

clauses
    hasIdentity("Alexey", "8 800 555 35 35", address("Krasnogorsk", "Flexa", 14, 88)).
    hasIdentity("Sergey", "8 322 228 14 88", address("Tambov", "Rabochaya", 1, 2)).
    hasIdentity("Pavel", "8 666 555 12 34", address("Toronto", "Tampa", 15, 77)).
    hasIdentity("Dmitriy", "8 666 666 66 66", address("Hell", "Satan", 6, 66)).
    hasIdentity("Mikhail", "8 123 456 78 90", address("Jazz", "Ocean", 7, 7)).

    hasCar("Dmitriy", "Nissan", "Beige", 1000000).
    hasCar("Dmitriy", "Velosiped", "Red", 40).
    hasCar("Pavel", "Cadillac", "Black", 5000000).
    hasCar("Mikhail", "Carsharing", "white", 100).

    hasDeposit("Alexey", "Tinkoff", 50000).
    hasDeposit("Alexey", "Sberbank", 300).
    hasDeposit("Sergey", "Tinkoff", 200000).
    hasDeposit("Sergey", "Sberbank", 0).
    hasDeposit("Sergey", "Raiffaisen", 30450).

    carByOwnerPhone(PhoneNumber, Surname, CarModel, CarPrice) :-
        hasIdentity(Surname, PhoneNumber, _), hasCar(Surname, CarModel, _, CarPrice).

    carModelByOwnerPhone(PhoneNumber, CarModel) :-
        carByOwnerPhone(PhoneNumber, _, CarModel, _).

    bankAndStreetBySurnameAndCity(Surname, City, Bank, Street) :-
        hasIdentity(Surname, _, address(City, Street, _, _)), hasDeposit(Surname, Bank, _).

goal
    carByOwnerPhone("8 666 666 66 66", Surname, CarModel, CarPrice).
    % carModelByOwnerPhone("8 666 666 66 66", Surname).
    % bankAndStreetBySurnameAndCity("Sergey", "Tambov", Bank, Street).