;;;; Mode hooks go here

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (paredit-mode +1)
	    (eldoc-mode +1)
	    (auto-fill-mode +1)
	    (local-set-key '[C-tab] 'lisp-complete-symbol)))