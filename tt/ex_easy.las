distance(0..5).
limit(2). 

#pos(id00@1,{idle},{slow_down, accelerate},{agent_at(1). car_at_distance(3). car_at_distance(4).}).
#pos(id01@1,{slow_down},{idle, accelerate},{agent_at(1). car_at_distance(5). car_at_distance(1).}).
#pos(id02@1,{accelerate},{slow_down, idle},{agent_at(2). car_at_distance(6). car_at_distance(5).}).
#pos(id03@1,{accelerate},{slow_down, idle},{agent_at(0). car_at_distance(4). car_at_distance(3).}).
#pos(id04@1,{slow_down},{idle, accelerate},{agent_at(2). car_at_distance(3). car_at_distance(5).}).
#pos(id05@1,{idle},{slow_down, accelerate},{agent_at(2). car_at_distance(4). car_at_distance(6).}).
#pos(id06@1,{slow_down},{idle, accelerate},{agent_at(0). car_at_distance(1). car_at_distance(0).}).
#pos(id07@1,{idle},{slow_down, accelerate},{agent_at(0). car_at_distance(2). car_at_distance(3).}).  
#pos(id08@1,{accelerate},{slow_down, idle},{agent_at(1). car_at_distance(5). car_at_distance(4).}).

%----------------------------------------------------------------------------------------

closest_car_at(Dm):- car_at_distance(Dm), car_at_distance(DM), Dm < DM.

distance_from_agent(Da):- agent_at(A), closest_car_at(Dm), distance(Da), Dm = A + Da. %da "evolvere" per in_the_way

someone_is_close(Da, Dl) :- distance_from_agent(Da), limit(Dl), Da < Dl.
someone_is_far(Da, Dl) :- distance_from_agent(Da), limit(Dl), Da > Dl.
someone_is_at(Da, Dl) :- distance_from_agent(Da), limit(Dl), Da = Dl.






%mode declaration ---------------------------------------------
#modeh(accelerate).
#modeh(idle).
#modeh(slow_down).

%#modeb(1, distance_from_agent(const(distance))).
#modeb(1, someone_is_close(var(distance_from_agent), const(limit))).
#modeb(1, someone_is_at(var(distance_from_agent), const(limit))). 
#modeb(1, someone_is_far(var(distance_from_agent), const(limit))).

#maxv(1).

%bias ----------------------------------
%#bias("penalty(2, head(X)) :- in_head(X).").
%#bias("penalty(1, body(X)) :- in_body(X).").

%#bias(":- not in_body(Y).").
