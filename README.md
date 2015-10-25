# CLP(FD) &mdash; Constraint Logic Programming over Finite Domains

CLP(FD), Constraint Logic Programming over Finite Domains, is
available in SWI-Prolog as
[library(clpb)](http://www.swi-prolog.org/man/clpfd.html).

This repository contains usage examples and tests of the library.

## Using CLP(FD) constraints

CLP(FD) is an instance of the general CLP(.) scheme, extending logic
programming with reasoning over specialised domains.

In the case of CLP(FD), the domain is the set of _integers_.

CLP(FD) constraints like `(#=)/2`, `(#\=)/2` and `(#<)/2` are meant to
be used as pure alternatives over lower-level arithmetic primitives.

