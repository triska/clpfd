# CLP(FD) &mdash; Constraint Logic Programming over Finite Domains

CLP(FD), Constraint Logic Programming over Finite Domains, is
available in SWI-Prolog as
**[library(clpfd)](http://www.swi-prolog.org/man/clpfd.html)**.

This repository contains usage examples and tests of the library.

## Using CLP(FD) constraints

CLP(FD) is an instance of the general CLP(.) scheme, extending logic
programming with reasoning over specialised domains.

In the case of CLP(FD), the domain is the set of _integers_.

CLP(FD) constraints like `(#=)/2`, `(#\=)/2` and `(#<)/2` are meant to
be used as pure alternatives for lower-level arithmetic primitives.

For example, we can use CLP(FD) constraints to obtain a version of
`n_factorial/2` that can be used as a true relation:

    :- use_module(library(clpfd)).

    n_factorial(0, 1).
    n_factorial(N, F) :-
            N #> 0,
            N1 #= N - 1,
            F #= N * F1,
            n_factorial(N1, F1).

This works in all directions, for example:

    ?- n_factorial(47, F).
    258623241511168180642964355153611979969197632389120000000000 ;
    false.

and also:

    ?- n_factorial(N, 1).
    N = 0 ;
    N = 1 ;
    false.

and also in the most general case:

    ?- n_factorial(N, F).
    N = 0,
    F = 1 ;
    N = F, F = 1 ;
    N = F, F = 2 ;
    N = 3,
    F = 6 .

## Example programs

This repository contains several example programs.

To get an idea of the power and usefulness of CLP(FD) constraints, I
recommend you start with the following examples:

[n_factorial.pl](n_factorial.pl): Shows how to use CLP(FD) constraints
for declarative arithmetic, obtaining more general programs.

[sudoku.pl](sudoku.pl): Uses CLP(FD) constraints to model and solve a
simple and well-known puzzle.

[n_queens.pl](n_queens.pl): Model the so-called ["N-queens
puzzle"](https://en.wikipedia.org/wiki/Eight_queens_puzzle) with
CLP(FD) constraints. This example is a good candidate to experiment
with different search strategies, specified as options for
[`labeling/2`](http://www.swi-prolog.org/pldoc/man?predicate=labeling/2).
