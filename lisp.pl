evalLISP(X,X):- number(X).
evalLISP(+(A,B),N):- evalLISP(A,X), evalLISP(B,Y), N is X+Y.
evalLISP(-(A,B),N):- evalLISP(A,X), evalLISP(B,Y), N is X-Y.
evalLISP(*(A,B),N):- evalLISP(A,X), evalLISP(B,Y), N is X*Y.
evalLISP(/(A,B),N):- evalLISP(A,X), evalLISP(B,Y), N is X/Y.

evalLISP(car([H|_]),X):- evalLISP(H,X).
evalLISP(car(A),N):- evalLISP(A,[N|_]).

evalLISP(cdr([_|T]),X):- evalLISP(T,X).
evalLISP(cdr(A),N):- evalLISP(A,[_|N]).

evalLISP([H],X):- evalLISP(H,X).
evalLISP([H],X):- evalLISP(H,X).
