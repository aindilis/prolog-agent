%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% parseLisp.pl
%%   Simple parser of PDDL lisp file into prolog syntax.
%% Author: Robert Sasak, Charles University in Prague
%%
%% Example: 
%% ?-parseLisp('blocks_world.pddl', O).
%%   O = lisp(blocks,
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

% parseLisp(+File, -Output).
% Parse PDDL lisp File and return it rewritten prolog syntax.   
parseLisp(F, O):-
	view([lispFile,F]),
	parseLisp(F, O, _).

% parseLisp(+File, -Output, -RestOfFile)
% The same as above and also return rest of file. Can be useful when lisp and problem are in one file.
parseLisp(File, Output, R) :-
		read_file(File, List),
		%% view(List),
		lisp(Output, List, R).

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

% List of DCG rules describing structure of lisp file in language PDDL.
% BNF description was obtain from http://www.cs.yale.edu/homes/dvm/papers/pddl-bnf.pdf
% This parser do not fully NOT support PDDL 3.0
% However you will find comment out lines ready for futher development.

lisp(lisp(Sexps))               --> oneOrMore(s_expression,Sexps).

s_expression(Sexp)              --> (atomic_symbol(Sexp) ; (['('],s_expression(SubSexp1),['.'],s_expression(SubSexp2),[')']) ; list(Sexp)).

list(Sexp)                      --> ['('],oneOrMore(s_expression,Sexps),[')'].

atomic_symbol(Symbol)           --> [letter],oneOrMore(atom_part,Part).

atom_part(Part)                 --> (letter(Letter) ; number(Number)).

letter(Letter)                  --> [Letter], {member(Letter,['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'])}.

%% number(Letter)                  --> [Letter], {member(Letter,['1','2','3','4','5','6','7','8','9','0'])}.

empty                           --> [' '].

:- consult('/var/lib/myfrdcsa/codebases/minor/agent-attempts/7/parser/pddl/2.2/sharedPDDL2.2.pl').






