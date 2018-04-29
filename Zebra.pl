member(X,[X|_]).
member(X,[_|Y]) :- member(X,Y).

rightTo(L, R, [L,R | _]).
rightTo(L, R, [_ | Rest])
	:- rightTo(L, R, Rest).

nextTo(X, Y, List) :-
	rightTo(X, Y, List).
nextTo(X, Y, List) :-
	rightTo(Y, X, List).

answer(WaterDrinker, ZebraOwner) :-
   Houses = [[house,norwegian,_,_,_,_],_,[house,_,_,_,milk,_],_,_],
   member([house,englishman,_,_,_,red], Houses),
   member([house,spaniard,dog,_,_,_], Houses),
   member([house,_,_,_,coffee,green], Houses),
   member([house,ukrainian,_,_,tea,_], Houses),
   rightTo([house,_,_,_,_,green], [house,_,_,_,_,ivory], Houses),   
   member([house,_,snails,"old Gold",_,_], Houses),
   member([house,_,_,kools,_,yellow], Houses),
   nextTo([house,_,_,chesterfields,_,_], [house,_,fox,_,_,_], Houses),
   nextTo([house,_,_,kools,_,_], [house,_,horse,_,_,_], Houses),
   member([house,_,_,"Lucky Strike","orange juice",_], Houses),
   member([house,japanese,_,parliaments,_,_], Houses),
   nextTo([house,norwegian,_,_,_,_], [house,_,_,_,_,blue], Houses),    
   member([house,_,_,_,milk,_],Houses),
   member([house,norwegian,_,_,_,_],Houses),
   
   
   member([house,WaterDrinker,_,_,water,_], Houses),
   member([house,ZebraOwner,zebra,_,_,_], Houses).