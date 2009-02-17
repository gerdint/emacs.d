;;;; Key binding customization goes here

(global-set-key (quote [f8]) (quote compile)) 
(global-set-key (quote [f5]) (quote gdb))

(global-set-key "r" (quote revert-buffer))
(global-set-key "a" (quote align-regexp))
(global-set-key "o" (quote overwrite-mode))
(global-set-key "c" (quote compile))
(global-set-key ";" (quote comment-dwim))
(global-set-key "j" (quote delete-indentation))
(global-set-key "t" (quote comment-dwtm))

(global-set-key "\"" 'skeleton-pair-insert-maybe)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "<" 'skeleton-pair-insert-maybe)
;; (global-set-key "`" 'skeleton-pair-insert-maybe)

;; me likes me source indented
(global-set-key '[remap newline] 'newline-and-indent)

(global-set-key "\C-b" 'Control-X-prefix)

(global-set-key (kbd "M-<delete>") 'kill-word)
