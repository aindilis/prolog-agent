:- dynamic prolog_files/2, prolog_files/3.

%% see also /var/lib/myfrdcsa/codebases/minor/situated-agent-attempts/agents/1/to.do

%% control emacs from prolog-agent, issue commands

:- assert(prolog_files(prolog_agent,'/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/3a.pl')).

:- ensure_loaded('/var/lib/myfrdcsa/codebases/minor/free-life-planner/lib/util/util.pl').

:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/free-life-planner/lib/calendaring/calendaring-new.pl').
:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/dates/frdcsa/sys/flp/autoload/dates.pl').
:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/free-life-planner/frdcsa/sys/flp/autoload/profile.pl').

:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/emacs-api.pl').
:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/emacs-commands.pl').

%% APIs
:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/firefox-api.pl').
:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/xdotool-api.pl').
:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/xautomation-api.pl').
:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/flux-api.pl').
%% :- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/unilang-api.pl').

%% :- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/shell-commands.d.pa').
%% :- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/emacs-commands.d.pa').

:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/parsers/index.pl').

:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/api-learner.pl').
:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/termination-detection.pl').

:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/el/emacs_lisp_understanding.pl').
:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/observations.pl').

:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/callables.pl').
:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/callables.d.pa.pl').

%% askpass

:- log_message('DONE LOADING PROLOG-AGENT.').

formalogModuleLoaded(prologAgent).

:- module(user).
