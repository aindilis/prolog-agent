:- emacsCommand([progn,['pop-to-buffer','"3a.pl"'],['end-of-buffer'],[insert,'"hello"']],Result).

%% :- emacsCommand([progn,['pop-to-buffer','"3a.pl"'],['end-of-buffer'],[insert,'"hello"']],Result).
%% :- emacsCommand(progn('pop-to-buffer'('"3a.pl"'),'end-of-buffer',insert('"hello"')),Result).
