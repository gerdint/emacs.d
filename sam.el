;; sam.el - Sam emulation

;; Sam behaves this way
(delete-selection-mode)

(defun sam-command (cmd)
  "Prompts user for sam command."
  (interactive "s: ")
  (sam-parse cmd))

(defun dot-beginning ()
  (region-beginning))

(defun dot-end ()
  (region-end))

;;; The dot is the pair (start . end)
(defalias 'make-dot 'cons)
(defalias 'start 'car)
(defalias 'end 'cdr)

(defun contents (d)
  (buffer-substring (start d) (end d)))

(defun sam-new-apply (func dot arg)
  (let ((new-dot (funcall func dot arg)))
    ;; We assume that the func makes sure that point ends up at end of dot
    (set-mark (dot-start new-dot))))
  
;;;; Text commands

;;; dot -> text -> dot
(defun sam-new-append (dot text)
  "Inserts text after the dot, and sets dot to the inserted text"
  (interactive "stext: ")
  (goto-char (dot-end dot))
  (let ((start (point)))
    (let (deactivate-mark)
      (insert text)
      (make-dot start (point)))))

(defun sam-test ()
  (interactive)
  (sam-new-apply 'sam-new-append (make-dot (region-beginning) (region-end)) "kaka"))

(defun sam-append (text)
  "Inserts text after the dot, and sets dot to the inserted text"
  (interactive "stext: ")
  (goto-char (dot-end))
  (set-mark (point))
  (insert text)
  (mark-active t))

(defun sam-change (text)
  (interactive "snew text: ")
  (delete-region (dot-beginning) (dot-end))
  (goto-char (dot-beginning))
  (set-mark (point))
  (insert text)
  (mark-active t))

(defun sam-delete ()
  "Deletes contents of dot."
  (interactive)
  (delete-region (dot-beginning) (dot-end)))

(defun sam-insert (text)
  "Inserts text before the dot, and sets dot to the inserted text"
  (interactive "stext: ")
  (goto-char (dot-beginning))
  (set-mark (point))
  (insert text)
  (mark-active t))

;;;; Display commands
(defun sam-print-contents-of-dot (dot)
  "Prints contents of dot."
  (message (contents dot)))

(defun sam-print-value-of-dot (dot)
  "Prints contents of dot."
  (message (format "%d; #%d,#%d" (line-number-at-pos) (start dot) (end dot))))

(setq a '(a . sam-insert))
(funcall (cdr a) "text")

(setq cmd-table
      '((a . sam-append)
	(c . sam-change)
	(i . sam-insert)
	(d . sam-delete)))

;; Format: [address]<cmd>[/<arg1>/[<arg2>/]]
(defun sam-parse (cmd-str)
  "Parse cmd-str and dispatch on command name"
  (string-match "\\(.\\)/\\([^/]*\\)/" cmd-str)
  (let ((cmd (match-string 1 cmd-str))
	(arg (match-string 2 cmd-str)))
    (funcall (cdr (assq (intern cmd) cmd-table)) arg)))
  
(sam-parse "i/heja/")

