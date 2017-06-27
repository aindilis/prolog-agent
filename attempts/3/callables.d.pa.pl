%% addToString('(',String).
%% addToString('insert',String).
%% addToString(' ',String).
%% addToString('"',String).
%% addToString('ls',String).
%% addToString('"',String).
%% addToString(')',String).

%% executeEmacsCommand(String). %% '(insert "ls")'

%% s_expression = atomic_symbol | "(" s_expression "."s_expression ")" | list

%% list = "(" s_expression < s_expression > ")"

%% atomic_symbol = letter atom_part

%% atom_part = empty | letter atom_part | number atom_part

%% letter = "a" | "b" | " ..." | "z"

%% number = "1" | "2" | " ..." | "9"

%% empty = " "

%% in order to run a command, you have to have the function, so you
%% have to know what to do to make the command


%% goal: list the directory in the emacs buffer

%% preconditions: be at the end of a shell buffer, be in the directory you wish to list

%% generate the emacs command to insert the shell command to list the directory
%% insert a shell command in a shell buffer


%% effects: generate an output of the current directory



%% goal: be at the end of a shell buffer

%% preconditions: be in a shell buffer

%% procedure: generate the emacs command to move to the end of the current buffer



%% goal: determine whether we are in a shell buffer

%% preconditions: be in an emacs session

%% obtain the value of the variable major-mode

%% see if it is equal to the value of 'shell-mode



%% goal: insert a shell command in a shell buffer


%% goal: generate an emacs command

%% follow the rules of the grammer

%% know which command you need


%% goal: send the emacs command to emacs

%% using formalog, run the command

%% connectToUniLang(AgentName,FormalogName,UniLangConnection),
%% perl5_method(UniLangConnection,'QueryAgentSWIPL',[ReceiverAgent,Args,Contnets],Result).

%% pdftotext 1307.7808.pdf
%% extract-links.pl -i 1307.7808.txt

%% (s 1 1 A)
%% (s 1 2 n)
%% (s 1 3 d)
%% (s 1 4 y)

%% use specialized parser || use general nlu parser w/ background info

durativeAction([
		name(shellCommand(pwd)),
		types([
		       are(['$VAR'('Dir')],directory),
		       are(['$VAR'('Ob1')],object),
		       are(['$VAR'('L')],location)
		      ]),
		duration(0.1),
		preconditions([
			       'over all'(autonomous('$VAR'('Ob0'))),
			       'over all'(mobile('$VAR'('Ob1'))),
			       'over all'(at('$VAR'('Ob0'),'$VAR'('L'))),
			       'at start'(at('$VAR'('Ob1'),'$VAR'('L')))
			      ]),
		effects([
			 'at end'(holding('$VAR'('Ob0'),'$VAR'('Ob1'))),
			 'at end'(not(at('$VAR'('Ob1'),'$VAR'('L')))),
			 'at end'([assign(actions,op(+,actions,1))])
			])
	       ]).

%% hasMethod(
%% 	  shellCommand(pwd),
%% 	  [
%% 	   ]
%% 	 ).

%% print name of current/working directory

%% preconditions: isa(S,shell),

%% runCommand(pwd,S)

%% POSTCONDITIONS: stdoutContains(X),isa(X,directory),isa(X,currentWorkingDirectory).

%% hasParser(Output,ParserName), isa(X,directory), isa(X, currentWorkingDirectory).

%% %% hasValue('(non-nil-2 (derived-mode-p ''shell-mode))',t)

durativeAction([
		name(shellCommand(pdftotext)),
		types([
		       are(['$VAR'('CWD')],directory),
		       are(['$VAR'('InputPath')],path),
		       are(['$VAR'('OutputPath')],path),
		       are(['$VAR'('AbsoluteInputPath')],path),
		       are(['$VAR'('AbsoluteOutputPath')],path)
		       ]),
		duration(0.1),
		precondtions([
			      hasArg(pdftotext,1,'$VAR'('InputPath')),
			      hasArg(pdftotext,implicit,'$VAR'('CWD')),
			      hasArg(pdftotext,inferred,'$VAR'('AbsoluteInputPath')),
			      hasArg(pdftotext,inferred,'$VAR'('Basename')),
			      hasArg(pdftotext,inferred,'$VAR'('OutputPath')),
			      hasArg(pdftotext,inferred,'$VAR'('AbsoluteOutputPath')),

			      'over all'(file_path_resolves_to('$VAR'('CWD'),'$VAR'('InputPath'),'$VAR'('AbsoluteInputPath'))),
			      'over all'(file_exists_p('$VAR'('AbsoluteInputPath'))),
			      'over all'(hasMimeType('$VAR'('AbsoluteInputPath'),'PDF document'))
			      ]),
		effects([
			 'at end'(file_path_resolves_to('$VAR'('CWD'),'$VAR'('OutputPath'),'$VAR'('AbsoluteOutputPath'))),
			 'at end'(basename('$VAR'('InputPath'),'$VAR'('Basename'))),
			 'at end'(concat('$VAR'('Basename'),'txt','$VAR'('OutputPath'))),
			 'at end'(file_path_resolves_to('$VAR'('CWD'),'$VAR'('OutputPath'),'$VAR'('AbsoluteOutputPath'))),
			 'at end'(file_exists_p('$VAR'('AbsoluteOutputPath'))),
			 'at end'(hasMimeType('$VAR'('AbsoluteOutputPath'),'Text document')),
			 'at end'(copyOfCW('$VAR'('AbsoluteInputPath'),'$VAR'('AbsoluteOutputPath')))
			])
	       ]).

%% gatherObservationsAboutCallable(shellCommand(pdftotext))