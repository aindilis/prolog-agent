% Simulates a single agent in the Gridworld where junk appears on each cycle
% at randomly determined locations in the 10x10 grid with probability 0.1

% run a trial of 20 cycles of the BDI interpreter starting with the agent at (0,0)

agent_trial :-
	init,
	agent_trials(0, 20, [at(0,0)], [], 0, Score),
	write('Total score: '), writeln(Score), !.


% initial state of the world

init :-
	assert(junk(0,0,0)),
	retractall(junk(_,_,_)),
	retractall(robot_at(_,_)),
	assert(robot_at(0,0)).


% run trials up to N

agent_trials(N, N, _, _, Score, Score) :- !.

agent_trials(N1, N, Beliefs, Intentions, Score, Score2) :-
	N1 < N,
	agent_cycle(N1, Beliefs, Beliefs1, Intentions, Intentions1, S),
	Score1 is Score + S,
	N2 is N1 + 1,
	agent_trials(N2, N, Beliefs1, Intentions1, Score1, Score2).


% the BDI interpretation cycle used by the agent

agent_cycle(N, Beliefs, Beliefs1, Intentions, Intentions3, S) :-
	write('Cycle '), write(N), writeln(':'),
	new_events(3),
	world(World),
	write('    World: '), writeln(World),
	write('    Beliefs: '), writeln(Beliefs),
	percepts(World, Beliefs, Percepts),
	write('    Percepts: '), writeln(Percepts),
	trigger(Percepts, Goals),
	incorporate_goals(Goals, Beliefs, Intentions, Intentions1),
	write('    Intentions: '), writeln(Intentions1),
	select_action(Beliefs, Intentions1, Intentions2, Action),
	write('    New Intentions: '), writeln(Intentions2),
	write('    Action: '), write(Action),
	execute(Action, S),
	write(' scores '), writeln(S),
	world(World1),
	write('    Updated World: '), writeln(World1),
	observe(Action, Observation),
	write('    Observation: '), writeln(Observation),
	update_beliefs(Observation, Beliefs, Beliefs1),
	write('    Updated Beliefs: '), writeln(Beliefs1),
	update_intentions(Observation, Intentions2, Intentions3),
	write('    Updated Intentions: '), writeln(Intentions3).


% list of junk items in the world

world(World) :-
	bagof(junk(X,Y,S), junk(X,Y,S), World), !.

world([]).


%  each with probability 0.1, a new junk item appears in at most M random locations on the 10x10 grid

new_events(0).

new_events(M) :-
	Prob is random(10),
	Prob = 0,
	X is round(random(10)),
	Y is round(random(10)),
	not(junk(X,Y,_)), !,		% check that no junk is already at location
	S is round(random(10)),
	write('    Event: junk value '), write(S), write(' appears at '), write('('), write(X), write(','), write(Y), writeln(')'),
	assert(junk(X,Y,S)),
	M1 is M - 1,
	new_events(M1).

new_events(M) :-
	M1 is M - 1,
	new_events(M1).


% new percepts are junk items within a viewing range of 10 of the agent

percepts([], _, []).

percepts([junk(X,Y,S)|World], [at(X1,Y1)], [junk(X,Y,S)|Percepts]) :-
        distance((X,Y), (X1,Y1), D),
	D < 10, !,
	percepts(World, [at(X1,Y1)], Percepts).

percepts([junk(_,_,_)|World], Beliefs, Percepts) :-
	percepts(World, Beliefs, Percepts).


% applicable actions in a state

applicable([at(X,Y)], move(X1,Y1)) :-
        distance((X,Y), (X1,Y1), 1).

applicable([at(X,Y)], pickup(X,Y)).


% execute action in the Gridworld -- always successfully!

execute(pickup(X,Y), S) :-
	retract(junk(X,Y,S)),
	assert(cleaned(X,Y)).

execute(move(X,Y), 0) :-
	retract(robot_at(X1,Y1)),
	distance((X1,Y1), (X,Y), 1),
	assert(robot_at(X,Y)).


% Manhattan distance between two squares

distance((X,Y), (X1,Y1), D) :-
	dif(X, X1, Dx),
	dif(Y, Y1, Dy),
	D is Dx + Dy.

% D is |A - B|
dif(A, B, D) :-
	D is A - B, D >= 0, !.

dif(A, B, D) :-
	D is B - A.


% observe result of action -- always correctly!

observe(move(_,_), at(X,Y)) :-
	robot_at(X, Y).

observe(pickup(_,_), cleaned(X,Y)) :-
	retract(cleaned(X,Y)).
