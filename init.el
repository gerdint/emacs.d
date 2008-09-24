;;;; Here I will place initialization code that is shared between different computers

(message "Initializing tger-elisp")

;; Add this directory to the load path
(setq load-path (cons "~/tger-elisp/" load-path))

(setq viper-mode t)
(require 'viper)

(when (boundp 'viper-vi-global-user-map)
  (define-key viper-vi-global-user-map (kbd "C-u")
  'universal-argument))

(require 'recentf)
(ffap-bindings)
(iswitchb-mode t)

;(prefer-coding-system 'utf-8-unix)

;; Swap normal delete behaviour
;; (global-set-key '[(backspace)] (quote backward-kill-word))
;; (global-set-key '[delete] 'kill-word) 
;(global-set-key (quote [C-backspace]) (quote backward-delete-char))

;;(define-key viper-vi-global-user-map "u"    'undo)
;;
; Like Sam 
;; (global-set-key (quote [up]) (quote scroll-down)) ; why does scroll-down scroll up? 
;; (global-set-key (quote [down]) (quote scroll-up)) 

; nice 
;; (global-set-key (quote [left]) (quote backward-word)) 
;; (global-set-key (quote [right]) (quote forward-word)) 

(global-set-key (quote [f5]) (quote undo)) 

;; redo
(require 'redo)
(global-set-key (quote [f6]) (quote redo))
(define-key viper-vi-global-user-map "\C-r" 'redo)

;; me likes me source indented
(global-set-key '[remap newline] 'newline-and-indent)

;; paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (eldoc-mode +1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (auto-fill-mode +1)))
(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd ")")
       'paredit-close-parenthesis)
     (define-key paredit-mode-map (kbd "M-)")
       'paredit-close-parenthesis-and-newline)))

(defun quick-edit-mode ()
   (global-set-key '[(mouse-3)] 'yank))

(delete-selection-mode)
;(quick-edit-mode)
