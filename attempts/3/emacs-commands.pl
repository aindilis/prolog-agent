%%%%%%%%%%%%%%

%% side-effects-oriented
%% emacsCommand(['ffap','"/var/lib/myfrdcsa/codebases/minor/normal-form/to.do"'],Result).
%% emacsCommand(['backward-char','10'],Result).
%% emacsCommand(['apropos','"apropos"'],Result).

%% results-oriented
%% emacsCommand(['not',['not',['derived-mode-p','''shell-mode']]],Result).
%% emacsCommand(['+',1,1],Result).

%% sensing-results-oriented
%% emacsCommand(['kmax-get-line'],Result).

%% other
%% evalEmacsExpression('(ffap "/var/lib/myfrdcsa/codebases/minor/normal-form/to.do")',Result).
%% emacsCommandTerm(progn('pop-to-buffer'('"3a.pl"'),'end-of-buffer',insert('"hello"')),Result).
%% FIXME: [contents,'eval (progn (pop-to-buffer "3a.pl") end-of-buffer (insert "hello"))']

%%%%%%%%%%%%%%

%% use IP lookup tables

%% FIXME: doesn't get password correct
%% emacsCommand([progn,['kmax-new-shell'],['sit-for',5],[insert,'"ssh 192.168.1.222"'],['comint-send-input'],['sit-for',3],['shell-command','"killall -9 zenity"'],['sit-for',5],[insert,Password],['sit-for',2],['exit-minibuffer'],['sit-for',5],[insert,'"ls"'],['comint-send-input']],Result).

%% emacsCommand(
%% 	     [progn,
%% 	      ['kmax-new-shell'],
%% 	      ['sit-for',5],
%% 	      [insert,'"ssh 192.168.1.222"'],
%% 	      ['comint-send-input'],
%% 	      ['sit-for',3],
%% 	      ['shell-command','"killall -9 zenity"'],
%% 	      ['sit-for',5],
%% 	      [insert,Password],
%% 	      ['sit-for',2],
%% 	      ['exit-minibuffer'],
%% 	      ['sit-for',5],
%% 	      [insert,'"ls"'],
%% 	      ['comint-send-input']
%% 	     ],Result).

%% emacsCommand(
%% 	     [progn,
%% 	      ['kmax-new-shell'],
%% 	      ['sit-for',5],
%%            ['end-of-buffer'],
%% 	      [insert,'"ssh 192.168.1.222"'],
%% 	      ['comint-send-input'],
%% 	      [expect,'"discouraged"',
%% 	       [progn,
%% 		['shell-command','"killall -9 zenity"'],
%% 		[expect,'"password"',
%% 		 [progn,
%% 		  [insert,Password],
%% 		  [expect,'Last login',
%% 		   [progn,
%% 		    ['exit-minibuffer'],
%% 		    [insert,'"ls"'],
%% 		    ['comint-send-input']
%% 		   ]
%% 		  ]
%% 		 ]
%% 		]
%% 	       ]
%% 	      ]
%% 	     ],Result).


%% emacsCommand([progn,['kmax-new-shell'],['sit-for',5],['end-of-buffer'],[insert,'"ssh 192.168.1.222"'],['comint-send-input'],[expect,'"discouraged"',[progn,['shell-command','"killall -9 zenity"'],[expect,'"password"',[progn,[insert,Password],[expect,'"Last login"',[progn,['exit-minibuffer'],[insert,'"ls"'],['comint-send-input']]]]]]]],Result).


%% need to write an expect like thing to monitor a buffer

%%%%%%%%%%%%%%

%% System::FLUX

%%%%%%%%%%%%%%

%% research epistemic actions, GDL-III etc.

%% in addition to asserting the :init as Function-Free FOPC via
%% translation, we can also assert the :goal via translation.

%%%%%%%%%%%%%%
