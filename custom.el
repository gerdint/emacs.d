;;;; Customizations go here

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(blink-cursor-mode nil)
 '(case-fold-search t)
 '(column-number-mode t)
 '(compilation-ask-about-save nil)
 '(compilation-scroll-output t)
 '(compile-command "cd ~/MissionTools-seconfig; make -srj6 recipe=/p/mss-work/bwp/bwp_seconfig/recipe/recipe.mk ewa")
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(ecb-options-version "2.33beta2")
 '(ecb-symboldef-find-backends (quote (semanticdb)))
 '(ecb-vc-enable-support t)
 '(gdb-many-windows t)
 '(inhibit-startup-screen t)
 '(kill-whole-line nil)
 '(longlines-wrap-follows-window-size t)
 '(mouse-autoselect-window 0.5)
 '(mouse-yank-at-point t)
 '(safe-local-variable-values (quote ((longlines-mode . t) (longlines . t))))
 '(sentence-end-double-space nil)
 '(shell-file-name "/bin/bash")
 '(show-paren-mode t nil (paren))
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 20) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (left-fringe . 0) (font . "lucidasans-12"))))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(viper-ESC-moves-cursor-back nil)
 '(viper-case-fold-search t)
 '(viper-want-ctl-h-help t)
 '(visible-bell t)
 '(which-function-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "gray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 101 :width normal :family "adobe-courier")))))
