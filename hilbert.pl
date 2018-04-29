
hilbert(N):-
    Board = [[[0,0]],0,0],
    hCurve(N,Board,[B,_,_]),
    writeHTML(N),writeJS(N,B).

writeHTML(N):-
    atom_concat('hilbert',N,X),
    atom_concat(X,'.html',F),
    atom_concat(X,'.js',G),
    open(F,write,Stream),
    write(Stream,'<!DOCTYPE html>'),  nl(Stream),
    write(Stream,'<html>'),  nl(Stream),
    write(Stream,'<head>'),  nl(Stream),
    write(Stream,'<title>Hilbert Curves</title>'),  nl(Stream),
    write(Stream,' </head>'),  nl(Stream),
    write(Stream,'<body>'),  nl(Stream),
    write(Stream,'<h3>Hilbert Curve Size = '),
    write(Stream,N), write(Stream,'</h3>'),  nl(Stream),
    write(Stream,'<canvas width="1000" height="1000"></canvas>'),  nl(Stream),
    write(Stream,'<script src="'),  
    write(Stream,G),
    write(Stream,' "></script>'),  nl(Stream),
    write(Stream,'</body>'),  nl(Stream),
    write(Stream,'</html>'),  nl(Stream), 
    close(Stream).

writeJS(N,B):-
    atom_concat('hilbert',N,X),
    atom_concat(X,'.js',G),
    open(G,write,Stream),
    write(Stream,' var coordinates ='),
    write(Stream,B),
    write(Stream,';'),
     nl(Stream),
    write(Stream,'let cx = document.querySelector("canvas").getContext("2d");'),
      nl(Stream),
    write(Stream,'cx.beginPath();'),
       nl(Stream),
    write(Stream,'cx.moveTo(0,0);'),
        nl(Stream),
    write(Stream,'for (i=0; i<coordinates.length; i++) {cx.lineTo(coordinates[i][0],coordinates[i][1])} '),
         nl(Stream),
    write(Stream,'cx.stroke(); '),
         nl(Stream),
    close(Stream).

goEast([B,R,C],[[[R,Y]|B],R,Y]):- Y is C+20.
goWest([B,R,C],[[[R,Y]|B],R,Y]):- Y is C-20.

goNorth([B,R,C],[[[Y,C]|B],Y,C]):- Y is R-20.
goSouth([B,R,C],[[[Y,C]|B],Y,C]):- Y is R+20.

aCurve(0,B,B).
aCurve(N,Board,NewBoard):-
    N>0,
    M is N-1,
    hCurve(M,Board,B1),
    goEast(B1,B2),
    aCurve(M,B2,B3),
    goSouth(B3,B4),
    aCurve(M,B4,B5),
    goWest(B5,B6),
    cCurve(M,B6,NewBoard).

bCurve(0,B,B).
bCurve(N,Board,NewBoard):-
    N>0,
    M is N-1,
    cCurve(M,Board,B1),
    goWest(B1,B2),
    bCurve(M,B2,B3),
    goNorth(B3,B4),
    bCurve(M,B4,B5),
    goEast(B5,B6),
    hCurve(M,B6,NewBoard).

cCurve(0,B,B).
cCurve(N,Board,NewBoard):-
    N>0,
    M is N-1,
    bCurve(M,Board,B1),
    goNorth(B1,B2),
    cCurve(M,B2,B3),
    goWest(B3,B4),
    cCurve(M,B4,B5),
    goSouth(B5,B6),
    aCurve(M,B6,NewBoard).

hCurve(0,B,B).
hCurve(N,Board,NewBoard):-
    N>0,
    M is N-1,
    aCurve(M,Board,B1),
    goSouth(B1,B2),
    hCurve(M,B2,B3),
    goEast(B3,B4),
    hCurve(M,B4,B5),
    goNorth(B5,B6),
    bCurve(M,B6,NewBoard).