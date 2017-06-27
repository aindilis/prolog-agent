(defvar prolog-agent-agent-name "Prolog-Agent-Agent1")

(global-set-key "\C-c\C-k\C-vPA" 'prolog-agent-quick-start)

(global-set-key "\C-cpagl" 'prolog-agent-action-get-line)
(global-set-key "\C-cpaws" 'prolog-agent-set-windows)
(global-set-key "\C-cpas" 'prolog-agent-quick-start)
(global-set-key "\C-cpar" 'prolog-agent-restart)
(global-set-key "\C-cpak" 'prolog-agent-kill)

(defun prolog-agent-issue-command (query)
 ""
 (interactive)
 (uea-query-agent-raw nil prolog-agent-agent-name
  (freekbs2-util-data-dumper
   (list
    (cons "_DoNotLog" 1)
    (cons "Eval" query)))))

(defun prolog-agent-action-get-line ()
 ""
 (interactive)
 (see (prolog-agent-issue-command
  (list "_prolog_list"
   (list "_prolog_list" 'var-Result)
   (list "emacsCommand"
    (list "_prolog_list" "kmax-get-line")
    'var-Result)))))

;; (see (freekbs2-util-data-dumper
;;    (list
;;     (cons "_DoNotLog" 1)
;;     (cons "Eval" 
;;   (list "_prolog_list"
;;    (list "_prolog_list" 'var-Result)
;;    (list "emacsCommand"
;;     (list "_prolog_list" "kmax-get-line")
;;     'var-Result))))))

(defun prolog-agent-quick-start ()
 ""
 (interactive)
 (prolog-agent)
 (prolog-agent-fix-windows)
 (prolog-agent-select-windows))

(defun prolog-agent (&optional load-command)
 ""
 (interactive)
 (if (prolog-agent-running-p)
  (error "ERROR: Prolog-Agent Already running.")
  (progn
   (run-in-shell "cd /var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3" "*Prolog-Agent*")
   (sit-for 3.0)
   (ushell)
   (sit-for 1.0)
   (pop-to-buffer "*Prolog-Agent*")
   (insert (or load-command "./prolog-agent-start -u"))
   (comint-send-input)
   (sit-for 3.0)
   (run-in-shell "cd /var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3 && ./prolog-agent-start-repl" "*Prolog-Agent-REPL*" nil 'shell-mode)
   (sit-for 1.0))))

(defun prolog-agent-set-windows ()
 ""
 (interactive)
 (prolog-agent-fix-windows)
 (prolog-agent-select-windows))

(defun prolog-agent-fix-windows ()
 ""
 (interactive)
 (delete-other-windows)
 (split-window-vertically)
 (split-window-horizontally)
 (other-window 2)
 (split-window-horizontally)
 (other-window -2))

(defun prolog-agent-select-windows ()
 ""
 (interactive)
 (switch-to-buffer "*Prolog-Agent*")
 (other-window 1)
 (switch-to-buffer "*ushell*")
 (other-window 1)
 (switch-to-buffer "*Prolog-Agent-REPL*")
 (other-window 1)
 (ffap "/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/3a.pl"))

;; emacsCommand(['kmax-get-line'],Result). 
;; (see (freekbs2-importexport-convert (list (list 'var-Result) (list "emacsCommand" (list "kmax-get-line") 'var-Result)) "Interlingua" "Perl String"))

;; "Eval" => {
;;           "_prolog_list" => {
;;                             "_prolog_list" => [
;;                                               \*{'::?Result'}
;;                                             ],
;;                             "emacsCommand" => [
;;                                               [
;;                                                 "_prolog_list",
;;                                                 "kmax-get-line"
;;                                               ],
;;                                               \*{'::?Result'}
;;                                             ]
;;                           }
;;         },

;; "Eval" => [
;;           [
;;             "_prolog_list",
;;             [
;;               "_prolog_list",
;;               \*{'::?Result'}
;;             ],
;;             [
;;               "emacsCommand",
;;               [
;;                 "_prolog_list",
;; 	        "kmax-get-line",
;;               ],
;;               \*{'::?Result'}
;;             ]
;;           ]
;;         ],

(defun prolog-agent-restart ()
 ""
 (interactive)
 (if (yes-or-no-p "Restart Prolog-Agent? ")
  (progn
   (prolog-agent-kill)
   (prolog-agent-quick-start))))


(defun prolog-agent-kill ()
 ""
 (interactive)
 (flp-kill-processes)
 (shell-command "killall -9 \"prolog-agent-start\"")
 (shell-command "killall -9 \"prolog-agent-start-repl\"")
 (shell-command "killall-grep Prolog-Agent-Agent1")
 (kmax-kill-buffer-no-ask (get-buffer "*Prolog-Agent*"))
 (kmax-kill-buffer-no-ask (get-buffer "*Prolog-Agent-REPL*"))
 ;; (kmax-kill-buffer-no-ask (get-buffer "*ushell*"))
 (prolog-agent-running-p))

(defun prolog-agent-running-p ()
 (interactive)
 (setq prolog-agent-running-tmp t)
 (let* ((matches nil)
	(processes (split-string (shell-command-to-string "ps auxwww") "\n"))
	(failed nil))
  (mapcar 
   (lambda (process)
    (if (not (kmax-util-non-empty-list-p (kmax-grep-v-list-regexp (kmax-grep-list-regexp processes process) "grep")))
     (progn
      (see process 0.0)
      (setq prolog-agent-running-tmp nil)
      (push process failed))))
   prolog-agent-process-patterns)
  (setq prolog-agent-running prolog-agent-running-tmp)
  (if (kmax-util-non-empty-list-p failed)
   (see failed 0.1))
  prolog-agent-running))

(defvar prolog-agent-process-patterns
 (list
  "prolog-agent-start"
  "prolog-agent-start-repl"
  "/var/lib/myfrdcsa/codebases/internal/unilang/unilang-client"
  "/var/lib/myfrdcsa/codebases/internal/freekbs2/kbs2-server"
  "/var/lib/myfrdcsa/codebases/internal/freekbs2/data/theorem-provers/vampire/Vampire1/Bin/server.pl"))

(load-if-exists "/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/expect.el")
(load-if-exists "/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/el/introspection.el")


;; <message>
;;   <id>1</id>
;;   <sender>Prolog-Agent-Agent1</sender>
;;   <receiver>Emacs-Client</receiver>
;;   <date>Sat Apr  1 10:16:28 CDT 2017</date>
;;   <contents>eval (run-in-shell \"ls\")</contents>
;;   <data>$VAR1 = {
;;           '_DoNotLog' => 1,
;;           '_TransactionSequence' => 0,
;;           '_TransactionID' => '0.667300679865178'
;;         };
;;   </data>
;; </message>

;; (see (eval (read "(run-in-shell \"ls\")")))
;; (see (cons "Result" nil ))

;; (see (freekbs2-util-data-dumper
;;      (list
;;       (cons "_DoNotLog" 1)
;;       (cons "Result" nil)
;;       )
;;       ))

;; ;; (see '(("_DoNotLog" . 1) ("Result")))
;; ;; (see '(("Result"))

;; (freekbs2-util-convert-from-emacs-to-perl-data-structures '(("_DoNotLog" . 1) ("Result")))
;; (mapcar 'freekbs2-util-convert-from-emacs-to-perl-data-structures '(("_DoNotLog" . 1) ("Result")))

;; (mapcar 'freekbs2-util-convert-from-emacs-to-perl-data-structures '(("_DoNotLog" . 1) ("Result")))

;; (see '(("_DoNotLog" . 1) ("Result")))
;; (see '(("Result")))
;; (see '(("_DoNotLog" . 1)))

;; (join ", " (mapcar 'freekbs2-util-convert-from-emacs-to-perl-data-structures '("Result")))

