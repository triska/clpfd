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
recommend you start with the following examples, in order:

[**n_factorial.pl**](n_factorial.pl): Shows how to use CLP(FD) constraints
for declarative arithmetic, obtaining more general programs.

[**sudoku.pl**](sudoku.pl): Uses CLP(FD) constraints to model and solve a
simple and well-known puzzle.

[**n_queens.pl**](n_queens.pl): Model the so-called ["N-queens
puzzle"](https://en.wikipedia.org/wiki/Eight_queens_puzzle) with
CLP(FD) constraints. This example is a good candidate to experiment
with different search strategies, specified as options of
[`labeling/2`](http://www.swi-prolog.org/pldoc/man?predicate=labeling/2).

[**knight.pl**](knight.pl): Closed Knight's Tour using CLP(FD)
constraints. This is an example of using a more complex *global
constraint* called
[`circuit/1`](http://www.swi-prolog.org/pldoc/man?predicate=circuit/1).

## Animations

If you are teaching Prolog and CLP(FD) constraints, it is very useful
to show *animations* of search processes. An instructional example:

[**N-queens animation**](http://www.metalevel.at/queens/): This
visualizes the search process for the N-queens example.

You can use similar [PostScript
instructions](http://www.metalevel.at/postscript/animations.html) to
create custom animations for other examples.

## SICStus compatibility

I am aiming for compatibility with the CLP(FD) system of SICStus
Prolog. All examples work with at most small changes with SICStus
Prolog too. For example, instead of `(ins/2)`, you need to use
`domain/3` in SICStus Prolog.

For better performance, I highly recommend you obtain a copy of
SICStus Prolog, and use it to solve more serious tasks with CLP(FD).

## Acknowledgments

I am extremely grateful to:

[**Tom Schrijvers**](http://people.cs.kuleuven.be/~tom.schrijvers/), who
has generously contributed several important constraint libraries to
SWI-Prolog (`dif/2`!!), and from whom I learned a lot.

[**Ulrich Neumerkel**](http://www.complang.tuwien.ac.at/ulrich/), who
introduced me to constraint logic programming and was the first and
most determined tester of my library, filing hundreds of comments. If
you are teaching Prolog, I recommend you check out his [GUPU
system](http://www.complang.tuwien.ac.at/ulrich/gupu/).

[**Mats Carlsson**](https://www.sics.se/~matsc/), the designer and main
implementor of SICStus Prolog and its superb [CLP(FD)
library](https://sicstus.sics.se/sicstus/docs/latest4/html/sicstus.html/lib_002dclpfd.html#lib_002dclpfd).
For any serious use of CLP(FD) constraints, make sure to check out his
elegant and fast system.
