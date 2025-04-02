
1{speed(1..3)}1.


%-------------------------------------------------------------
#pos(id00@1,{accelerate(1)},{slow_down(1), slow_down(2), slow_down(3), idle, accelerate(2), accelerate(3)},{agent_speed(0). target_speed(2).}).
#pos(id01@1,{idle},{slow_down(1), slow_down(2), slow_down(3), accelerate(1), accelerate(2), accelerate(3)},{agent_speed(0). target_speed(0).}).
#pos(id02@1,{accelerate(3)},{slow_down(1), slow_down(2), slow_down(3), accelerate(1), accelerate(2), idle},{agent_speed(0). target_speed(3).}).
#pos(id03@1,{accelerate(2)},{slow_down(1), slow_down(2), slow_down(3), accelerate(1), idle, accelerate(3)},{agent_speed(0). target_speed(3).}).
#pos(id04@1,{slow_down(1)},{idle, slow_down(2), slow_down(3), accelerate(1), accelerate(2), accelerate(3)},{agent_speed(2). target_speed(1).}).
#pos(id05@1,{accelerate(1)},{slow_down(1), slow_down(2), slow_down(3), idle, accelerate(2), accelerate(3)},{agent_speed(1). target_speed(2).}).
#pos(id06@1,{idle},{slow_down(1), slow_down(2), slow_down(3), accelerate(1), accelerate(2), accelerate(3)},{agent_speed(1). target_speed(1).}).
#pos(id07@1,{slow_down(2)},{slow_down(1), idle, slow_down(3), accelerate(1), accelerate(2), accelerate(3)},{agent_speed(3). target_speed(1).}).
#pos(id08@1,{slow_down(3)},{slow_down(1), slow_down(2), idle, accelerate(1), accelerate(2), accelerate(3)},{agent_speed(3). target_speed(0).}).
#pos(id09@1,{slow_down(2)},{slow_down(1), idle, slow_down(3), accelerate(1), accelerate(2), accelerate(3)},{agent_speed(2). target_speed(0).}).


% ---------------------------------------------------

close(A,T):- agent_speed(A), target_speed(T), A = T.
over(A,T):- agent_speed(A), target_speed(T), A > T.
%far(A,T):- agent_speed(A), target_speed(T), A < T.


%valid_speed_for_distance(S,A,T) :- speed(S), far(A,T), T >= A + S.
valid_speed_for_distance(S,A,T) :- speed(S), over(A,T), A >= T + S.



%Mode Declaration -----------------------------------------------
#modeh(slow_down(var(speed))).
%#modeh(accelerate(var(speed))).
#modeh(idle).

#modeb(1,close(var(agent_speed), var(target_speed))).
#modeb(1,over(var(agent_speed), var(target_speed))).
%#modeb(1,far(var(agent_speed), var(target_speed))).
#modeb(1,valid_speed_for_distance(var(speed),var(agent_speed), var(target_speed))).  % primitivi



%#modeb(1,var(speed)).

#maxv(3).


%bias ---------------------------------------
#bias(":- agent_speed(A), target_speed(T), speed(S),T > A, T < S + A.").
#bias(":- agent_speed(A), target_speed(T), speed(S),A > T, A < S + T.").

%#bias(":- in_head(slow_down(X)), not in_body(speed(Y)).").
%#bias(":- in_head(slow_down(X)), in_body(speed(Y)), X/=Y.").

%#bias(":- in_head(slow_down(_)), not in_body(valid_speed_for_distance(_)).").
%#bias(":- in_head(slow_down(V0)), in_body(valid_speed_for_distance(X,_,_)), V0!=X.").
#bias(":- in_head(slow_down(V0)), not in_body(valid_speed_for_distance(V0,V0,_)).").
