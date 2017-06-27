:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/convert.pl').

evalEmacsExpression(Expression,Result) :-
	atomic_list_concat(['eval ',Expression],Contents),
	queryEmacs(Contents,[],Result).

queryEmacs(Contents,DataArg,Result) :-
	append(['_DoNotLog',1],DataArg,Data),
	view([contents,Contents]),
	queryAgent('Prolog-Agent-Agent1','Prolog-Agent-Yaswi1','Emacs-Client',Contents,Data,Result).

emacsCommandAutoVivify(Args,Result) :-
	convert_prolog_list_to_sexp(Args,1,Sexp),
	emacsCommand(['progn',['uea-autovivify'],Sexp],Result).

emacsCommand(Args,Result) :-
	convert_prolog_list_to_sexp(Args,1,Sexp),
	view([sexp,Sexp]),
	evalEmacsExpression(Sexp,Result).

emacsCommandTerm(Term,Result) :-
	convert_term_to_prolog_list(Term,PrologList),
	emacsCommand(PrologList,Result).

%% find emacs introspection commands

%% https://www.emacswiki.org/emacs/EmacsLispIntrospection

%% (symbol-function 'apropos)
%% (help-function-arglist 'apropos)
%% (documentation 'apropos)
%% (symbol-file 'apropos)

