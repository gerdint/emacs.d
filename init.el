;;;; Here I will place initialization code that is shared between different computers

(message "Setting up tger Emacs...")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Add this directory to the load path
(setq load-path (cons "~/.emacs.d" load-path))

;; (ffap-bindings)

(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

;;;; Key binding customization goes here
(global-set-key (quote [f8]) (quote compile)) 

(global-set-key "g" (quote lgrep))
(global-set-key "G" (quote rgrep))
(global-set-key "j" (quote imenu))
(global-set-key "f" (quote find-dired))
(global-set-key "r" (quote revert-buffer))
(global-set-key "a" (quote align-regexp))
(global-set-key "o" (quote occur))
(global-set-key "c" (quote compile))
(global-set-key "d" (quote copy-line))
(global-set-key ";" (quote comment-dwim))
(global-set-key "t" (quote comment-dwtm))

;; me likes me source indented
(global-set-key '[remap newline] 'newline-and-indent)

(global-set-key "\C-b" 'Control-X-prefix)

;; (global-set-key "\C-h" 'backward-delete-char)
(global-set-key (kbd "M-<delete>") 'kill-word)

;;;; Mode hooks go here
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (paredit-mode +1)
	    (eldoc-mode +1)
	    (auto-fill-mode +1)
	    (local-set-key '[C-tab] 'lisp-complete-symbol)))

;;;; Modes that I want enabled by default goes here

;; (iswitchb-mode t)
(ido-mode t)
(delete-selection-mode)
(savehist-mode t)
(blink-cursor-mode -1)
(global-hi-lock-mode 1)

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
