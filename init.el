;;;; Here I will place initialization code that is shared between different computers

(message "Setting up tger Emacs...")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Add this directory to the load path
(setq load-path (cons "~/.emacs.d" load-path))

(require 'recentf)
(ffap-bindings)

(load "keys.el")
(load "hooks.el")
(load "modes.el")

;; paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd ")")
       'paredit-close-parenthesis)
     (define-key paredit-mode-map (kbd "M-)")
       'paredit-close-parenthesis-and-newline)))

(defun quick-edit-mode ()
   (global-set-key '[(mouse-3)] 'yank))
;(quick-edit-mode)

(setenv "PAGER" "/bin/cat")
(setenv "EDITOR" "emacsclient")
(server-start)

(fset 'yes-or-no-p 'y-or-n-p)
(setq skeleton-pair t)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(defun comment-dwtm ()
  "Comment-DoWhatTobiasMeans

Sets the region to the current line and calls `comment-dwim'."
  (interactive)
  ;; mark line
  (set-mark (line-beginning-position))
  (end-of-line)
  (comment-dwim nil))

;; Source .emacs if available
(defvar dot-emacs "~/.tger-emacs")
(when (and (file-exists-p dot-emacs)
	   (file-readable-p dot-emacs))
  (load dot-emacs))

(message "Done.")