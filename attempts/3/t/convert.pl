:- consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/convert.pl').

:- convert_prolog_list_to_sexp(['not',['not',['derived-mode-p','''shell-mode']]],1,X), nl,view(X),nl.
:- convert_prolog_list_to_sexp(['kmax-list','test',['not',['derived-mode-p','''shell-mode']]],1,X), nl,view(X),nl.
:- convert_prolog_list_to_sexp(['progn',['pop-to-buffer','"3a.pl"'],['end-of-buffer'],[insert,'"hello"']],1,X), nl,view(X),nl.

:- convert_prolog_list_to_term([progn,['pop-to-buffer','"3a.pl"'],['end-of-buffer'],[insert,'"hello"']],X), nl,view(X),nl.

:- convert_term_to_prolog_list(progn('pop-to-buffer'('"3a.pl"'),'end-of-buffer',insert('"hello"','hoi')),X), nl,view(X),nl.