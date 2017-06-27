formalogModuleLoaded(none).

:- dynamic seen/1.

:- ensure_loaded('/var/lib/myfrdcsa/codebases/minor/free-life-planner/lib/util/util.pl').
:- consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/el/parseEmacsLisp.pl').

%% :- parseEmacsLisp('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/el/sexp.txt',Result),view(Result).

convertFunctionNameToPDDLFileRecursively(FunctionName,[IncomingPDDLSemantics|PDDLSemantics]) :-
	Dir = '/var/lib/myfrdcsa/codebases/minor/prolog-agent/data-git/function-sources',
	retrieveSourceOfFunctionName(FunctionName,FunctionSource),
	atomic_list_concat([FunctionName,'.el'],'',Basename),
	frdcsaElConcatDir([Dir,Basename],FileName),
	write_data_to_file(FunctionSource,FileName),
	parseEmacsLisp(FileName,Parsed),
	convertFunctionNameToPDDLFileHelper(FunctionName,FunctionSource,FileName,Parsed,IncomingPDDLSemantics),
	view([done]).

retrieveSourceOfFunctionName(FunctionName,FunctionSource) :-
	functionNameToQuotedFunctionName(FunctionName,QuotedFunctionName),
	view([1]),
	emacsCommandHelper(['prolog-agent-el-get-elisp-function-source',QuotedFunctionName],FunctionSource).

convertFunctionNameToPDDLFileHelper(FunctionName,FunctionSource,FileName,Parsed,[IncomingPDDLSemantics|PDDLSemantics]) :-
	%% do the semantic analysis here
	extractPDDLSemantics(FunctionName,FunctionSource,FileName,Parsed,IncomingPDDLSemantics),
	view([incomingPDDLSemantics,IncomingPDDLSemantics]),
	getFunctionNames(Parsed,FunctionNames),
	view([functionNames2,FunctionNames]),
	findall(Tmp,
	 	(
		 member(FunctionName2,FunctionNames),
		 view([recursiveFunctionName,FunctionName2]),
		 convertFunctionNameToPDDLFileRecursively(FunctionName2,Tmp)
		),
		PDDLSemantics).

functionNameToQuotedFunctionName(FunctionName,QuotedFunctionName) :-
	atomic_list_concat(['\'',FunctionName],'',QuotedFunctionName).

getFunctionNames(Parsed,FunctionNames) :-
	functionNames(FunctionNamesList),
	view([functionNamesList,FunctionNamesList]),
	setof(SubTerm,Parsed^FunctionNamesList^(term_contains_subterm(SubTerm,Parsed),member(SubTerm,FunctionNamesList),not(seen(SubTerm))),FunctionNames),
	view([functionNames,FunctionNames]).

functionNames(['defun','find-function','recenter-top-bottom']).

emacsCommandHelper(Invocation,QuotedFunctionName) :-
	view([invocation,Invocation]),
	(   formalogModuleLoaded(prologAgent) ->
	    emacsCommand(Invocation,QuotedFunctionName) ;
	    emacsCommandSample(Invocation,QuotedFunctionName) ).

emacsCommandSample(['prolog-agent-el-get-elisp-function-source',QuotedFunctionName],Source) :-
	view([quotedFunctionName,QuotedFunctionName]),
	(   QuotedFunctionName = '\'man' ->  
	    Source = '(defun kmax-find-function-or-macro-elisp (&optional function-arg)
	    (	interactive)
	    (	let ((function (or function-arg (kmax-function-macro-or-special-form-at-point))))
	    (	find-function function)
	    (	recenter-top-bottom)))' ;
	(   QuotedFunctionName = '\'defun' ->
	    Source = '(defun defun (fake))' ;
	    (	QuotedFunctionName = '\'find-function' ->
		Source = '(defun find-function (fake))' ;
		(   QuotedFunctionName = '\'recenter-top-bottom' ->
		    Source = '(defun recenter-top-bottom (fake))' ; true)))).
	    
extractPDDLSemantics(FunctionName,FunctionSource,FileName,Parsed,PDDLSemantics) :-
	%% process it here
	PDDLSemantics = [Parsed],
	assert(seen(FunctionName)),
	view([parsed,Parsed,pddlSemantics,PDDLSemantics]).
