;;;; Here I will place initialization code that is shared between different computers

(message "Setting up tger Emacs...")

(require 'server)
(unless (server-running-p)
  (server-start))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Add this directory to the load path
(setq load-path (cons "~/.emacs.d" load-path))

(fset 'xml-mode 'nxml-mode)

;; (ffap-bindings)

(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;;;; Key binding customization goes here
(global-set-key "j" (quote imenu))
(global-set-key "f" (quote senator-fold-tag-toggle))
(global-set-key "R" (quote revert-buffer))
(global-set-key "a" (quote align-regexp))
(global-set-key "o" (quote occur))
(global-set-key "c" (quote compile))
(global-set-key "l" (quote dictionary-lookup-definition))
(global-set-key "d" (quote copy-line))
(global-set-key ";" (quote comment-dwim))
(global-set-key "t" (quote comment-dwtm))
(global-set-key "s" (lambda () (interactive) (switch-to-buffer "*scratch*")))
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
(global-visual-line-mode t)

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
(windmove-default-keybindings)
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

(defadvice forward-word (after vi-like-forward-word)
  "Forwards one word, including trailing whitespace."
  (skip-chars-forward " \t"))
(ad-activate 'forward-word)

(global-set-key "\M-sg" 'grep)
(global-set-key "\M-sl" 'lgrep)
(global-set-key "\M-sr" 'rgrep)
(global-set-key "\M-sf" 'find-dired)

(global-set-key (quote [home]) (quote beginning-of-buffer))
(global-set-key (quote [end]) (quote end-of-buffer))

(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     java-mode       scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))