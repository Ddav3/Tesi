limit(1..40).
lane(1..4).
distance(1..40).

%ego(L1, L2) -> L1 = lane attuale; L2 = lane destinazione


%-------------------------------------------------------------
#pos(id00@1,{idle},{},{ego(1,3). obs_car( 6, 1, 3).}).
#pos(id01@1,{idle},{},{ego(1,3). obs_car( 8, 1, 3).}).
#pos(id02@1,{},{idle},{ego(1,3). obs_car(10, 2, 2).}).
#pos(id03@1,{},{idle},{ego(1,3). obs_car( 4, 1, 3).}).
#pos(id04@1,{},{idle},{ego(1,3). obs_car( 9, 1, 3).}).
#pos(id05@1,{},{idle},{ego(1,3). obs_car( 4, 4, 2).}).
#pos(id06@1,{idle},{},{ego(2,2). obs_car( 7, 4, 4).}).      
#pos(id07@1,{},{idle},{ego(2,2). obs_car(12, 2, 4).}).
#pos(id08@1,{idle},{},{ego(2,2). obs_car( 6, 2, 2).}).  
#pos(id09@1,{},{idle},{ego(2,2). obs_car( 5, 2, 2).}).
#pos(id10@1,{},{idle},{ego(2,2). obs_car(14, 3, 1).}).      %
#pos(id11@1,{idle},{},{ego(1,3). obs_car( 7, 1, 3).}).
#pos(id12@1,{idle},{},{ego(1,3). obs_car(10, 2, 4).}).      
#pos(id13@1,{idle},{},{ego(1,3). obs_car( 9, 4, 4).}).      
#pos(id14@1,{idle},{},{ego(1,3). obs_car(11, 4, 2).}).      
#pos(id15@1,{},{idle},{ego(1,3). obs_car(14, 3, 1).}).
#pos(id16@1,{},{idle},{ego(1,3). obs_car( 6, 3, 1).}).
#pos(id17@1,{},{idle},{ego(1,3). obs_car( 1, 1, 1).}).
#pos(id18@1,{idle},{},{ego(1,3). obs_car( 9, 3, 1).}).      
#pos(id19@1,{idle},{},{ego(2,2). obs_car( 8, 2, 2).}).      
#pos(id20@1,{idle},{},{ego(1,3). obs_car( 8, 4, 2).}). 
#pos(id17@1,{},{idle},{ego(1,3). obs_car(20, 2, 2).}).



% ---------------------------------------------------

obs_is_close(Dist, Dl) :- obs_car(Dist, L1, L2), limit(Dl), Dist < Dl.
obs_is_far(Dist, Dl) :- obs_car(Dist, L1, L2), limit(Dl), Dist > Dl.

obs_is_crossing :- obs_car(Dist, L1, L2), L1 != L2.
same_lane :- ego(L1a, L2a), obs_car(Dist, L1, L2), L1a = L1, L2a = L2.




%Mode Declaration -----------------------------------------------
#modeh(idle).

#modeb(1, obs_is_close(var(distance), const(limit))).
#modeb(1, obs_is_far(var(distance),  const(limit))).
#modeb(1, obs_is_crossing).
#modeb(1, same_lane).
#modeb(not same_lane).

#maxv(4).


%bias ---------------------------------------
%#bias(":- not in_body(obs_is_crossing), in_body(same_lane).").

#bias("penalty(1, head(X)) :- in_head(X).").
%#bias("penalty(1, body(X)) :- in_body(X).").



