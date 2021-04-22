domains
    name, sex = symbol.
    human = human(name, sex).

predicates
    isParent(human, human).
    isGrandparent(human, sex, human).

clauses
    isGrandparent(human(GName, GSex), LSex, human(Name, Sex)) :- 
        isParent(human(GName, GSex), human(TmpName, LSex)), isParent(human(TmpName, _), human(Name, Sex)).

    isParent(human("Natasha", "Woman"), human("Sergey Jr.", "Man")).
    isParent(human("Sergey", "Man"), human("Sergey Jr.", "Man")).
    isParent(human("Faina", "Woman"), human("Sergey", "Man")).
    isParent(human("Nikolay", "Man"), human("Sergey", "Man")).
    isParent(human("Galina", "Woman"), human("Natasha", "Woman")).
    isParent(human("Anatoliy", "Man"), human("Natasha", "Woman")).

goal
    isGrandparent(human(QGname, "Woman"), _, human("Sergey Jr.", "Man")).
    % isGrandparent(human(QGname, "Man"), _, human("Sergey Jr.", "Man")).
    % isGrandparent(QHuman, _, human("Sergey Jr.", "Man")).
    % isGrandparent(human(QGname, "Woman"), "Woman", human("Sergey Jr.", "Man")).
    % isGrandparent(QHuman, "Woman", human("Sergey Jr.", "Man")).
    