desires(prologAgent,achieve(packageIsInstalled(xboard,aiFrdcsaOrg))).

main :-
	repeat,
	execute_one_step(X),
	sleep(1),
	fail.
	
execute_one_step(X) :-
	desires(prologAgent,achieve(Goal)),
	planToAchieve(Goal,Plan).

action(
       installPackage(Package,Machine),
       [],
       [not(packageIsInstalled(Package,Machine)),packageIsInstallableOn(Package,Machine)],
       [packageIsInstalled(Package,Machine)]
      ).

%% action(epistemicAction()).

action(
       checkToSeeIfPackageIsInstallableOn,
       parameters(Package,Machine),
       [],
       [not(knows(prologAgent,packageIsInstallableOn(Package,Machine)))],
       [knows(prologAgent,packageIsInstallableOn(Package,Machine))]
      ).

checkToSeeIfPackageIsInstallableOn(Package,Machine) :-
	composeCommand,
	shell.

knows(prologAgent,packageIsInstallableOn(Package,Machine))
%% packageIsInstalled(Package,Machine),

commandHasArguments('apt-get',['install',Package]).
commandHasArguments('apt-cache',['search',Search]).

%% hasBindings(Query,Bindings).

action(
       sense(Statement,Value),
       [],
       [not(knows(prologAgent,value(Statement,Value)))],
       [knows(prologAgent,packageIsInstallableOn(Package,Machine))]
      ).

%% checkToSeeIfPackageIsInstallableOn(Package,Machine) :-
%% 	%% parse out the apt-cache search results
%% 	atomic_list_concat(['apt-cache','search',Package],' ',Command),
%% 	shell(Command,Result),
%% 	view(Result).

