:- use_module(library(lists)).

% candidate(-S): S is a list of four p(Name,Dept,Lang,Project) terms in the
% order Alex, Ben, Carla, Dana, where each department, language and project
% value is used exactly once.
candidate([p('Alex',D1,L1,P1),
           p('Ben',D2,L2,P2),
           p('Carla',D3,L3,P3),
           p('Dana',D4,L4,P4)]) :-
    permutation([research, development, design, testing], [D1,D2,D3,D4]),
    permutation([python, java, 'c++', javascript], [L1,L2,L3,L4]),
    permutation(['AI', web, embedded, data], [P1,P2,P3,P4]).

% clue(1, +S): the friend who prefers 'AI' does not work in research and is not Dana.
clue(1, S) :-
    member(p(Name, Dept, _, 'AI'), S),
    Dept \== research,
    Name \== 'Dana'.

% clue(2, +S): Alex does not work in development and does not prefer 'c++'.
clue(2, S) :-
    member(p('Alex', Dept, Lang, _), S),
    Dept \== development,
    Lang \== 'c++'.

% clue(3, +S): the friend working in the testing department likes python.
clue(3, S) :-
    member(p(_, testing, python, _), S).

% clue(4, +S): Ben prefers web and does not work in testing.
clue(4, S) :-
    member(p('Ben', Dept, _, web), S),
    Dept \== testing.

% clue(5, +S): the friend whose favorite language is java works in the design department.
clue(5, S) :-
    member(p(_, design, java, _), S).

% clue(6, +S): Carla's project is not embedded and her department is not development.
clue(6, S) :-
    member(p('Carla', Dept, _, Project), S),
    Project \== embedded,
    Dept \== development.

% clue(7, +S): Dana's favorite language is not java, and she works in research or testing.
clue(7, S) :-
    member(p('Dana', Dept, Lang, _), S),
    Lang \== java,
    ( Dept == research ; Dept == testing ).
