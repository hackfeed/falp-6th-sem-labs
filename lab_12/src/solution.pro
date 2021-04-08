domains
    id = unsigned.
    name, university = symbol.

predicates
    idOfStudent(id, name).
    studyingIn(id, university).
    studentsFromUniversity(university, id, name).

clauses
    idOfStudent(0, "Alexey").
    idOfStudent(1, "Sergey").
    idOfStudent(2, "Pavel").
    idOfStudent(3, "Dmitriy").
    idOfStudent(4, "Mikhail").

    studyingIn(0, "BMSTU").
    studyingIn(1, "BMSTU").
    studyingIn(2, "BMSTU").
    studyingIn(3, "BMSTU").
    studyingIn(4, "BMSTU").
    studyingIn(0, "KTU").
    studyingIn(2, "Cambridge").
    studyingIn(3, "MIREA").

    studentsFromUniversity(University, Id, Name) :- idOfStudent(Id, Name), studyingIn(Id, University).

goal
    idOfStudent(Id, "Sergey").
    % idOfStudent(0, Name).

    % studyingIn(Id, "BMSTU").
    % studyingIn(0, University).

    % studentsFromUniversity("BMSTU", Id, Name).
    % studentsFromUniversity(University, Id, "Alexey").
