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
