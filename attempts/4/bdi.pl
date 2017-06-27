%% Abstract BDI Interpreter:
%%   initialize-state();
%%   do
%%     get-new-external-event(events);
%%     G := trigger(events);
%%     incorporate-goals(G, I);
%%     action := select-action(B, I);
%%     execute(action);
%%     observe(action, facts);
%%     update-beliefs(facts, B);
%%     update-intentions(facts, I);
%%   until quit

abstractBDIInterpreter :-
	initializeState,
	doMainLoop.

initializeState :-
	true.

doMainLoop :-
	repeat,
	getNewExternalEvent(Events),
	trigger(Events,Goals),
	incorporateGoals(Goals, Intentions),
	selectAction(Beliefs, Intentions, Action),
	execute(Action),
	observe(Action, Facts),
	updateBeliefs(Facts, Beliefs),
	updateIntentions(Facts, Intentions),
	fail.

getNewExternalEvent(Events) :-
	true.

trigger(Events,Goals) :-
	true.

incorporateGoals(Goals, Intentions) :-
	true.

selectAction(Beliefs, Intentions, Action) :-
	true.

execute(Action) :-
	true.

observe(Action, Facts) :-
	true.

updateBeliefs(Facts, Beliefs) :-
	true.

updateIntentions(Facts, Intentions) :-
	true.

%% see also /var/lib/myfrdcsa/codebases/minor/situated-agent-attempts/agents/2/prolog-setanta-agent.pl
