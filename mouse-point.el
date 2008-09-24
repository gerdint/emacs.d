(defun foo (point)
  (interactive "d")
  (message "%s" point))

(defun foo-adapter (event)
  "Dispatch to foo. Works, but here foo is hard-coded."
  (interactive "e")
  (save-excursion
    (posn-set-point (event-end event))
    (foo (point))))

(defun posn-to-point-adapter (receiver)
  "Returns a function that applies RECEIVER to the point
indicated by the mouse position event."
  (lexical-let ((f receiver))
    (lambda (evt)
      (interactive "e")
      (funcall f
	       (save-excursion
		 (posn-set-point (event-end evt))
		 (point))))))

;;(global-set-key '[(S-down-mouse-1)] (posn-to-point-adapter 'foo))

