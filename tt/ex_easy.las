%constant(distance, 1). 
%distance(2).
%constant(distance, 3). 


#pos(id00@1,{idle},{slow_down, accelerate},{distance(2). car_at_distance(2).}).
#pos(id01@1,{slow_down},{idle, accelerate},{distance(2). car_at_distance(1).}).
#pos(id02@1,{accelerate},{slow_down, idle},{distance(2). car_at_distance(3).}).
#pos(id03@1,{accelerate},{slow_down, idle},{distance(2). car_at_distance(3).}).
#pos(id04@1,{slow_down},{idle, accelerate},{distance(2). car_at_distance(1).}).
#pos(id05@1,{idle},{slow_down, accelerate},{distance(2). car_at_distance(2).}).
#pos(id06@1,{slow_down},{idle, accelerate},{distance(2). car_at_distance(1).}).
#pos(id07@1,{idle},{slow_down, accelerate},{distance(2). car_at_distance(2).}).  

%----------------------------------------------------------------------------------------

is_close(D, Dl) :- car_at_distance(D), distance(Dl), D < Dl.
is_far(D, Dl) :- car_at_distance(D), distance(Dl), D > Dl.
is_at(D, Dl) :- car_at_distance(D), distance(Dl), D = Dl.






%mode declaration ---------------------------------------------
#modeh(accelerate).
#modeh(idle).
#modeh(slow_down).

#modeb(var(car_at_distance)).
#modeb(1, is_close(var(car_at_distance), const(distance))).
%#modeb(not is_close(var(car_at_distance), const(distance))).
#modeb(1,is_at(var(car_at_distance), const(distance))).
#modeb(not is_at(var(car_at_distance), const(distance))).
#modeb(1, is_far(var(car_at_distance), const(distance))).

#maxv(2).

%bias ----------------------------------
#bias("penalty(2, head(X)) :- in_head(X).").
#bias("penalty(2, body(X)) :- in_body(X).").

%#bias(":- in_head(slow_down), not in_body(is_close(_,_)).").

%#bias(":- in_head(accelerate), not in_body(is_far(_,_)).").