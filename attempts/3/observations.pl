gatherObservationsAboutCallable(shellCommand(Command),Observations) :-
	listUndefinedCallables(UndefinedCallables),
	member(shellCommand(Command),UndefinedCallables),
	emacsCommand(['run-in-shell',Command],Result).

%% Dad: it needs to be foolproof.
%% Dad: [apophatic]

%% emacsCommandAutoVivify(['run-in-shell','"cd /home/andrewdo; ls *.pdf"'],Result). %% this is having this error: error in process filter: join: Wrong type argument: listp, 1

%% emacsCommand(['run-in-shell','"ls"'],Result).