%% Need to come up with a command loop, in which it checks the date,
%% and then applies the rules.  for instance, after a certain time, if
%% it is thought that Mom will be asleep.

%% we wrote a file watching program, use this as the basis
%% /var/lib/myfrdcsa/codebases/minor/logicmoo-frdcsa/2/prolog-setanta-agent.pl

main :-
	repeat,
	execute_one_step(X),
	sleep(1),
	fail.

execute_one_step(X) :-
	do_time_checks(X).

do_time_checks(X) :-
	getCurrentDateTime([Y-M-D,H:Mi:S]),
	runChecks(dateTime,[Y-M-D,H:Mi:S]),
	runChecks(date,[Y-M-D]),
	runChecks(time,[H:Mi:S]).

runChecks(Type,Time) :-
	true. %% Type.

launchProgram(Program) :-
	write(Program), (fork(child), exec(Program) ; true).

launchPrograms :-
	log(DateTime1,hasSymptom(Person,'obstructiveSleepApnea')),
	getCurrentDateTime([Y-M-D,H:Mi:S]),
	(H > 19 ; H < 7) ->
	(
	 launchProgram('/usr/bin/stopwatch'),
	 launchProgram('/var/lib/myfrdcsa/codebases/internal/akahige/scripts/restart-patient-monitors.sh')
	 %% launchProgram('/var/lib/myfrdcsa/codebases/internal/akahige/scripts/record-patient-monitors.sh'),
	 ).

%% check if program is running
