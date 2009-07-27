;;;; Customizations go here

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(blink-cursor-mode nil)
 '(bookmark-save-flag t)
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-firefox-program "opera")
 '(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "stroustrup"))))
 '(case-fold-search t)
 '(column-number-mode t)
 '(compilation-ask-about-save nil)
 '(compilation-auto-jump-to-first-error t)
 '(compilation-read-command nil)
 '(compilation-scroll-output t)
 '(compile-command "cd ~/mini5/client; ant | sed -f improve.sed")
 '(cua-auto-mark-last-change nil)
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "Latin-1")
 '(default-input-method "swedish-postfix")
 '(desktop-save-mode nil)
 '(dired-listing-switches "-l")
 '(enable-local-variables t)
 '(filesets-data (quote (("mini5" (:files "/home/tger/mini5/client/src/generic/com/opera/mini/generic/SocketStream.java" "/home/tger/bream/ui/component/web/obml/src/OBMLDocument.bream" "/home/tger/bream/ui/component/web/obml/src/OBMLBrowser.bream" "/home/tger/mini5/client/etc/build.properties" "/home/tger/mini5/client/src/generic/com/opera/mini/generic/Application.java" "/home/tger/mini5/client/src/generic/com/opera/mini/generic/Document.java")))))
 '(fill-column 80)
 '(focus-follows-mouse t)
 '(gdb-many-windows t)
 '(global-semantic-decoration-mode nil nil (semantic-decorate-mode))
 '(global-semantic-highlight-edits-mode nil nil (semantic-util-modes))
 '(global-semantic-idle-completions-mode nil nil (semantic-idle))
 '(global-semantic-idle-scheduler-mode t nil (semantic-idle))
 '(global-semantic-idle-summary-mode nil nil (semantic-idle))
 '(global-semantic-show-parser-state-mode nil nil (semantic-util-modes))
 '(global-semantic-show-unmatched-syntax-mode nil nil (semantic-util-modes))
 '(global-semantic-stickyfunc-mode nil nil (semantic-util-modes))
 '(global-senator-minor-mode t nil (senator))
 '(gnus-save-newsrc-file nil)
 '(gnus-thread-operation-ignore-subject nil)
 '(grep-command "grep -nH -i ")
 '(grep-files-aliases (quote (("asm" . "*.[sS]") ("c" . "*.c") ("cc" . "*.cc *.cxx *.cpp *.C *.CC *.c++") ("cchh" . "*.cc *.[ch]xx *.[ch]pp *.[CHh] *.CC *.HH *.[ch]++") ("hh" . "*.hxx *.hpp *.[Hh] *.HH *.h++") ("ch" . "*.[ch]") ("el" . "*.el") ("h" . "*.h") ("l" . "[Cc]hange[Ll]og*") ("m" . "[Mm]akefile*") ("tex" . "*.tex") ("texi" . "*.texi") \.\.\.)))
 '(gud-gdb-command-name "/sw/gcc/4.2/pkg/gdb/6.8/bin/gdb --annotate=3")
 '(gud-pdb-command-name "/usr/lib/python2.4/pdb.py")
 '(gud-tooltip-mode t)
 '(ido-enable-flex-matching t)
 '(ido-use-filename-at-point t)
 '(ido-use-url-at-point t)
 '(imenu-auto-rescan nil)
 '(imenu-sort-function (quote imenu--sort-by-name))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(input-method-highlight-flag nil)
 '(jde-built-class-path (quote ("/home/tger/mini5/client/output/build/global-int/classes")))
 '(jde-complete-function (quote jde-complete-in-line))
 '(jde-jdk-registry (quote (("1.5.0" . "/usr/lib/jvm/java-1.5.0-sun"))))
 '(jde-mode-line-format (quote ("-" mode-line-mule-info mode-line-modified mode-line-frame-identification mode-line-buffer-identification "   " (vc-mode vc-mode) "   %[(" mode-name mode-line-process minor-mode-alist "%n" ")%]--" (line-number-mode "L%l--") (column-number-mode "C%c--") (-3 . "%p") (jde-which-method-mode ("--" jde-which-method-format "--")) "-%-")))
 '(jde-xref-store-prefixes (quote ("com.opera.mini.generic")))
 '(kill-whole-line nil)
 '(ldap-host-parameters-alist (quote (("web.oslo.opera.com" base "o=Opera Software ASA, dc=opera,dc=com"))))
 '(longlines-wrap-follows-window-size t)
 '(menu-bar-mode t)
 '(mouse-autoselect-window -0.2)
 '(mouse-yank-at-point t)
 '(safe-local-variable-values (quote ((longlines-mode . t) (longlines . t))))
 '(scroll-bar-mode nil)
 '(semanticdb-global-mode t nil (semanticdb))
 '(senator-highlight-found nil)
 '(sentence-end-double-space nil)
 '(shell-file-name "/bin/bash")
 '(show-paren-mode t nil (paren))
 '(show-trailing-whitespace nil)
 '(speedbar-show-unknown-files t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode t)
 '(vc-cvs-diff-switches "-u")
 '(vc-handled-backends (quote (RCS CVS SVN SCCS Git Bzr Hg Arch)))
 '(viper-ESC-moves-cursor-back nil)
 '(viper-case-fold-search t)
 '(viper-want-ctl-h-help t)
 '(visible-bell t)
 '(visual-line-fringe-indicators (quote (nil right-curly-arrow)))
 '(which-func-modes (quote (emacs-lisp-mode c-mode c++-mode perl-mode cperl-mode python-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode diff-mode java-mode)))
 '(which-function-mode t)
 '(wl-interactive-send nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "gray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 99 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(cursor ((nil (:background "pink")))))
