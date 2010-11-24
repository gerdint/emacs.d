;;;; Here I will place initialization code that is shared between different computers

(message "Setting up tger Emacs...")

(load-library "misc")

(require 'server)
(unless (server-running-p)
  (server-start))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Add this directory to the load path
(setq load-path (cons "~/.emacs.d" load-path))

;; (fset 'xml-mode 'nxml-mode)

;; (ffap-bindings)

;;;; Key binding customization goes here
(global-set-key "j" (quote imenu))
(global-set-key "f" (quote senator-fold-tag-toggle))
(global-set-key "r" (quote rename-buffer))
(global-set-key "R" (quote revert-buffer))
(global-set-key "a" (quote align-regexp))
(global-set-key "o" (quote occur))
(global-set-key "c" (quote compile))
(global-set-key "l" (quote dictionary-lookup-definition))
(global-set-key "d" (quote copy-from-above-command))
(global-set-key ";" (quote comment-dwim))
(global-set-key "t" (quote comment-dwtm))
(global-set-key "s" (lambda () (interactive) (switch-to-buffer "*scratch*")))
(global-set-key "S" 'shell)
(global-set-key "v" (quote view-file))
;; More useful than killing X
(global-set-key (kbd "C-M-<backspace>") (lambda () (interactive) (kill-sexp -1)))

;; me likes me source indented
(global-set-key '[remap newline] 'newline-and-indent)

;; (global-set-key "\C-b" 'Control-X-prefix)
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))

(global-set-key (kbd "M-<delete>") 'kill-word)

;;;; Mode hooks go here
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (paredit-mode +1)
	    (eldoc-mode +1)
	    (auto-fill-mode +1)
            (local-set-key (kbd "M-.") 'find-function)))

;;;; Modes that I want enabled by default goes here

;; (iswitchb-mode t)
;; (ido-mode t)
(delete-selection-mode)
(savehist-mode t)
(blink-cursor-mode -1)
(global-hi-lock-mode 1)

(setq scroll-step 1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

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


(setenv "PAGER" "/bin/cat")
(setenv "EDITOR" "emacsclient")

(fset 'yes-or-no-p 'y-or-n-p)

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

;; (recentf-mode 1)
;; (windmove-default-keybindings)
(global-set-key (vector 'left)  'windmove-left)
(global-set-key (vector 'right) 'windmove-right)
(global-set-key (vector 'up)    'windmove-up)
(global-set-key (vector 'down)  'windmove-down)
;; (define-key minibuffer-mode-map)
;; (filesets-init)

(setq frame-title-format "%f")

;; Source .emacs if available
(defvar local-dot-emacs "~/.host.el")
(when (and (file-exists-p local-dot-emacs)
	   (file-readable-p local-dot-emacs))
  (load local-dot-emacs))

(setq debug-on-error nil)
(message "Done.")

;; (defun tger-kill-word (arg)
;;   (interactive "P")
;;   (kill-region (point) (progn (forward-word arg) (skip-chars-forward " \t") (point))))

;; (global-set-key '[remap kill-word] 'tger-kill-word)

;; (defadvice forward-word (after vi-like-forward-word)
;;   "Forwards one word, including trailing whitespace."
;;   (skip-chars-forward " \t"))
;; (ad-activate 'forward-word)

(global-set-key "\M-sg" 'grep)
(global-set-key "\M-sl" 'lgrep)
(global-set-key "\M-sr" 'rgrep)
(global-set-key "\M-sv" 'vc-git-grep)
(global-set-key "\M-sf" 'find-dired)

(global-set-key "	" 'comint-dynamic-complete-filename)

(global-set-key (quote [home]) (quote beginning-of-buffer))
(global-set-key (quote [end]) (quote end-of-buffer))

(global-set-key '[remap zap-to-char] 'zap-up-to-char)

;; (add-hook 'set-language-environment-hook
;;           (when (equal current-language-environment "Swedish")
;;             (setq default-input-method "swedish-postfix")
;;             (toggle-input-method)))

(delq 'process-kill-buffer-query-function kill-buffer-query-functions)