car_at_distance(1..20).

%1{limit(1..10)}1.
limit(7).


%-------------------------------------------------------------
#pos(id00@1,{accelerate},{slow_down},{car_at_distance(8).}).
#pos(id01@1,{slow_down},{accelerate},{car_at_distance(5).}).
#pos(id02@1,{accelerate},{slow_down},{car_at_distance(16).}).
#pos(id03@1,{accelerate},{slow_down},{car_at_distance(11).}).
#pos(id04@1,{slow_down},{accelerate},{car_at_distance(7).}).
#pos(id05@1,{accelerate},{slow_down},{car_at_distance(18).}).
#pos(id06@1,{slow_down},{accelerate},{car_at_distance(4).}).
#pos(id07@1,{accelerate},{slow_down},{car_at_distance(10).}).
#pos(id08@1,{accelerate},{slow_down},{car_at_distance(18).}).
#pos(id09@1,{slow_down},{accelerate},{car_at_distance(7).}).
#pos(id10@1,{accelerate},{slow_down},{car_at_distance(20).}).
#pos(id11@1,{slow_down},{accelerate},{car_at_distance(5).}).
#pos(id12@1,{accelerate},{slow_down},{car_at_distance(8).}).
#pos(id13@1,{slow_down},{accelerate},{car_at_distance(6).}).
#pos(id14@1,{slow_down},{accelerate},{car_at_distance(2).}).
#pos(id15@1,{accelerate},{slow_down},{car_at_distance(9).}).
#pos(id16@1,{accelerate},{slow_down},{car_at_distance(14).}).
#pos(id17@1,{accelerate},{slow_down},{car_at_distance(17).}).
#pos(id18@1,{slow_down},{accelerate},{car_at_distance(7).}).
#pos(id19@1,{slow_down},{accelerate},{car_at_distance(7).}).
#pos(id20@1,{accelerate},{slow_down},{car_at_distance(9).}).
#pos(id21@1,{accelerate},{slow_down},{car_at_distance(12).}).
#pos(id22@1,{slow_down},{accelerate},{car_at_distance(6).}).
#pos(id23@1,{accelerate},{slow_down},{car_at_distance(15).}).
#pos(id24@1,{slow_down},{accelerate},{car_at_distance(3).}).
#pos(id25@1,{accelerate},{slow_down},{car_at_distance(14).}).
#pos(id26@1,{slow_down},{accelerate},{car_at_distance(5).}).
#pos(id27@1,{accelerate},{slow_down},{car_at_distance(17).}).
#pos(id28@1,{slow_down},{accelerate},{car_at_distance(2).}).
#pos(id29@1,{accelerate},{slow_down},{car_at_distance(13).}).
#pos(id30@1,{slow_down},{accelerate},{car_at_distance(4).}).
#pos(id31@1,{accelerate},{slow_down},{car_at_distance(18).}).
#pos(id32@1,{slow_down},{accelerate},{car_at_distance(7).}).
#pos(id33@1,{accelerate},{slow_down},{car_at_distance(11).}).

% ---------------------------------------------------

distance_leq(Distance, L) :- car_at_distance(Distance), limit(L), Distance<=L.  
%distance_gt(Distance, L) :- car_at_distance(Distance), limit(L), Distance>L.


%Mode Declaration -----------------------------------------------
#modeh(slow_down).
#modeh(accelerate).


#modeb(distance_leq(var(car_at_distance), const(limit))).
#modeb(not distance_leq(var(car_at_distance), const(limit))).

%#modeb(distance_gt(var(car_at_distance), const(limit))).
%#modeb(not distance_gt(var(car_at_distance), const(limit))).

#maxv(1).


%bias ---------------------------------------
%#bias(":- in_body(distance_leq(X,_), not distance_leq(X,_)).").

#bias("penalty(2, head(X)) :- in_head(X).").
#bias("penalty(1, body(X)) :- in_body(X).").

%#bias("penalty(1, body(distance_leq(X,Y))) :- in_body(distance_leq(X,Y)).").

