(defun prolog-agent-el-test ()
 ""
 (interactive)
 (let* ((function 'man)
	(function-source (prolog-agent-el-get-elisp-function-name-source function)))
  (prolog-agent-el-extract-planning-domain-form-function-definition function-source)))

(defun prolog-agent-el-extract-planning-domain-form-function-definition ()
 ""
 (interactive)
 (kmax-not-yet-implemented))

;; write a save-excursion-restore-buffers

;; (defmacro quote-thing (arg)
;; `(list 'quote (list 'intern ,arg)))

;; (quote-thing "man")

(defun prolog-agent-el-get-elisp-function-name-source (function-name)
 ""
 (save-excursion
  (kmax-find-function-or-macro-elisp function-name)
  (set-mark (point))
  (forward-sexp)
  (buffer-substring-no-properties (mark) (point))))

(defun prolog-agent-el-get-elisp-function-name-string-source (function-name)
 ""
 (save-excursion
  (kmax-find-function-or-macro-elisp (quote (intern function-name)))
  (set-mark (point))
  (forward-sexp)
  (buffer-substring-no-properties (mark) (point))))

;; (defmacro test-test (arg)
;;  `(list 'prolog-agent-el-get-elisp-function-name-source '(read ,arg)))

;; (kmax-find-function-or-macro-elisp 'man)

;; (prolog-agent-el-get-elisp-function-name-source 'man)

;; (test-test "man")

;; program in ability to use Emacs *Backtrace*
