---
name: prolog-dev
description: Write, run, test and review SWI-Prolog 9.x code for the CS F301 Assignment 2 Prolog problems (P1, P2). Use for any Prolog predicate, clue, test or review in this repo.
---

# prolog-dev

## Language and version
- SWI-Prolog 9.x (`swipl --version`). Standard Prolog plus SWI built-ins only.
- Allowed libraries: `lists`, `apply`, `yall`, `aggregate`. Nothing else.
- Forbidden: `assert*`, `retract*`, `b_setval`/`nb_setval`, `halt/0` inside the file, any `:- initialization` directive.
- Do not print anything except what the task specifies.

## Coding conventions
- File names: `<groupid>_q1.pl`, `<groupid>_q2.pl` (group ID replaces `id`). Files contain only definitions.
- Atoms and predicates in `snake_case`; variables in `CamelCase`; `_` for unused variables (no singleton warnings).
- One predicate per unit of work. Put a one-line comment above each predicate: `% name(+Arg, -Arg): what it means.`
- Give every predicate a declarative reading: say in the comment when it is true, not what it "does".
- Quoted atoms exactly as specified: `'Alex'`, `'AI'`, `'c++'`.
- Prefer pure relations and recursion over if-then-else and cuts. Use `\+`, `\=`, `dif/2` only where the logic needs them.
- Put the clauses of a predicate together. Put base cases before recursive cases.

## How to run
- Run main: `swipl -q -f FILE.pl -g main -t halt`
- Run any goal: `swipl -q -f FILE.pl -g "GOAL" -t halt`
- Load check (must print nothing): `swipl -q -f FILE.pl -g true -t halt`
- A goal that fails prints a warning and exits non-zero; use that to detect failures.

## How to test
- One test file per problem in `tests/`, run the same way with `-g`.
- Test every example in the assignment text, then edge cases: empty list, length-1 list, no solution, many solutions, duplicates.
- For counts, check with `findall/3` + `length/2` and compare to a known value.
- Test that a predicate **fails** (not errors or loops) where failure is specified, e.g. `\+ generate_equation([], _)`.

## Self-review checklist (apply before answering)
1. Does the file load with no output and no warnings (`-g true -t halt`)?
2. No forbidden built-ins, no extra libraries, no `halt`, no `initialization`.
3. Each predicate does exactly the requested unit of work, nothing more.
4. Every variable is used or is `_`; no singleton warnings.
5. Quoted atoms match the spec character for character.
6. Predicate terminates for all inputs, including `[]` and singletons, and fails (not errors) when there is no answer.
7. Output format matches the spec byte for byte (spacing, quotes, newlines).
8. The answer is derived from the rules, not hard-coded.
9. The examples in the assignment give the stated results when run.

## Known AI failure modes in Prolog
- Writing imperative code (loops, counters) instead of relations.
- Hard-coding the puzzle answer instead of deriving it from the clues.
- Using `assert`/`retract` or global variables, or adding `:- initialization(main).` and `halt.`.
- Printing extra text (debug lines, "true.", prompts).
- Misusing cuts so a predicate loses solutions, or forgetting a cut and returning duplicates.
- Negation as failure on unbound variables: `\+ member(X, L)` before `X` is bound gives wrong answers. Bind first, negate after.
- Singleton variable typos that silently change meaning; mixing up `=` (unify), `==` (identical), `is` (evaluate), `=:=` (arithmetic compare).
- Using `is` on unbound variables (instantiation error), or `/` where integer exactness matters (use `mod` check or `//`).
- Atom vs string vs code-list confusion: `"abc"` is a string in SWI-Prolog 9, not an atom.
- Left recursion or unbounded generators that loop instead of failing.
- Forgetting to quote atoms that start with a capital letter or contain symbols (`'Alex'`, `'c++'`).
- Assuming a library predicate exists (check it is in `lists`/`apply`/`yall`/`aggregate`).
- Claiming the code was run or tested when it was not.
