%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% parseEmacsLisp.pl
%%   Simple parser of PDDL emacsLisp file into prolog syntax.
%% Author: Robert Sasak, Charles University in Prague
%%
%% Example: 
%% ?-parseEmacsLisp('blocks_world.pddl', O).
%%   O = emacsLisp(blocks,
%%        [strips, typing, 'action-costs'],
%%        [block],
%%        _G4108,
%%        [ on(block(?x), block(?y)),
%%	         ontable(block(?x)),
%%	         clear(block(?x)),
%%	         handempty,
%%	         holding(block(?x)) ],
%%        [number(f('total-cost', []))],
%%        _G4108,
%%        [ action('pick-up', [block(?x)],       %parameters
%%		      [clear(?x), ontable(?x), handempty], %preconditions
%%		      [holding(?x)],                       %positiv effects
%%          [ontable(?x), clear(?x), handempty], %negativ effects
%%          [increase('total-cost', 2)]),        %numeric effects
%%         ...],
%%       ...)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Support for reading file as a list.

:- ensure_loaded('/var/lib/myfrdcsa/codebases/minor/flp-pddl/prolog-pddl-parser/prolog-pddl-3-0-parser-20140825/readFileI.pl').

% parseEmacsLisp(+File, -Output).
% Parse PDDL emacsLisp File and return it rewritten prolog syntax.   
parseEmacsLisp(F, O):-
	view([emacsLispFile,F]),
	parseEmacsLisp(F, O, _).

% parseEmacsLisp(+File, -Output, -RestOfFile)
% The same as above and also return rest of file. Can be useful when emacsLisp and problem are in one file.
parseEmacsLisp(File, Output, R) :-
		read_file(File, List),
		view([list,List]),
		emacsLisp(Output, List, R).

lower_case_list(A,B) :-
	findall(Y,(member(X,A),lower_case(X,Y)),B).

capitalize(WordLC, WordUC) :-
	atom_chars(WordLC, [FirstChLow|LWordLC]),
	atom_chars(FirstLow, [FirstChLow]),
	upcase_atom(FirstLow, FirstUpp),
	atom_chars(FirstUpp, [FirstChUpp]),
	atom_chars(WordUC, [FirstChUpp|LWordLC]).

% Defining operator ?. It is a syntax sugar for marking variables: ?x
:-op(300, fy, ?).

% List of DCG rules describing structure of emacsLisp file in language PDDL.
% BNF description was obtain from http://www.cs.yale.edu/homes/dvm/papers/pddl-bnf.pdf
% This parser do not fully NOT support PDDL 3.0
% However you will find comment out lines ready for futher development.

emacsLisp(emacsLisp(Sexps))               --> oneOrMore(s_expression,Sexps).

s_expression(Sexp)              --> atomic_symbol(Sexp).
s_expression(Sexp)              --> ['('],s_expression(SubSexp1),['.'],s_expression(SubSexp2),[')'], {Sexp = [SubSexp1,SubSexp2]}.
s_expression(Sexp)              --> ['('],atomic_symbol(Symbol),zeroOrMore(s_expression,SubSexps),[')'],{Sexp =.. [Symbol|SubSexps]}.
s_expression(Sexp)              --> list(Sexp).
s_expression(Sexp)              --> ['('],s_expression(Sexp),[')'].
%% s_expression(Sexp)              --> ['(','('],s_expression(Sexp),[')',')'].

list(Sexp)                      --> ['('],oneOrMore(s_expression,Sexps),[')'].

atomic_symbol(Symbol)           --> name(Symbol).
%% atomic_symbol(Symbol)           --> [Item],{atom_concat('&',Tail,Symbol),name(Tail)}.
atomic_symbol(Symbol)           --> number(Symbol).
atomic_symbol(Symbol)           --> [Symbol],{Symbol = '+'}.

:- consult('/var/lib/myfrdcsa/codebases/minor/agent-attempts/7/parser/pddl/2.2/sharedPDDL2.2.pl').
