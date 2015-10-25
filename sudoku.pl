/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Sudoku CLP(FD) formulation.

   Written Feb. 2008 by Markus Triska  (triska@metalevel.at)
   Public domain code.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

:- use_module(library(clpfd)).

sudoku(Rows) :-
        length(Rows, 9), maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..9,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns), maplist(all_distinct, Columns),
        Rows = [A,B,C,D,E,F,G,H,I],
        blocks(A, B, C), blocks(D, E, F), blocks(G, H, I).

blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
        all_distinct([A,B,C,D,E,F,G,H,I]),
        blocks(Bs1, Bs2, Bs3).

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Sample problems.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

problem(1, P) :-
        P = [[1,_,_,8,_,4,_,_,_],
             [_,2,_,_,_,_,4,5,6],
             [_,_,3,2,_,5,_,_,_],
             [_,_,_,4,_,_,8,_,5],
             [7,8,9,_,5,_,_,_,_],
             [_,_,_,_,_,6,2,_,3],
             [8,_,1,_,_,_,7,_,_],
             [_,_,_,1,2,3,_,8,_],
             [2,_,5,_,_,_,_,_,9]].

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Example:

   ?- problem(1, Rows), sudoku(Rows),
      maplist(labeling([ff]), Rows), maplist(writeln, Rows).
   %@ [1,5,6,8,9,4,3,2,7]
   %@ [9,2,8,7,3,1,4,5,6]
   %@ [4,7,3,2,6,5,9,1,8]
   %@ [3,6,2,4,1,7,8,9,5]
   %@ [7,8,9,3,5,2,6,4,1]
   %@ [5,1,4,9,8,6,2,7,3]
   %@ [8,3,1,5,4,9,7,6,2]
   %@ [6,9,7,1,2,3,5,8,4]
   %@ [2,4,5,6,7,8,1,3,9]
   %@ Rows = [[1, 5, 6, 8, 9, 4, 3, 2|...], [9, 2, 8, 7, 3, 1, 4|...], [4, 7, 3, 2, 6, 5|...], [3, 6, 2, 4, 1|...], [7, 8, 9, 3|...], [5, 1, 4|...], [8, 3|...], [6|...], [...|...]].

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
