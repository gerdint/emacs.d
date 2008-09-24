(defconst sam-table
  (wisent-compile-grammar
   '((NUM POUND DOLLAR DOT MARK SLASH SPACE STR)		

     ((left COMMA SEMICOLON)	
      (left PLUS MINUS)	  ; + and - are higher precedence than , and ;
      )		

     (input
      ((address operation)
       (list $1 $2))
      ((operation)
       (append '((DOT)) $1))
      )

     (operation
      ((command SLASH STR SLASH)
       (list $1 $3))
      ;; Loops and conditionals
      ((command SLASH STR SLASH SPACE operation) ; no test case for this one yet
       (list $1 $3 $5))
      ((command SPACE address)
       (list $1 $3))
      ((command SPACE STR)
       (list $1 $3))
      ((command SLASH STR SLASH STR SLASH) ; for 's' command
       (list $1 $3 $5))
      ((command)
       (list $1))
      )

     (command
      ((STR)
       (intern $1))
      )

     (address		
      ((address COMMA address)
       (list 'COMMA $1 $3))
      ((address SEMICOLON address)
       (list 'SEMICOLON $1 $3))
      ((address PLUS address)
       (list 'PLUS $1 $3))
      ((address MINUS address)
       (list 'MINUS $1 $3))
      ((simple-address))
      )			

     (simple-address
      ((POUND NUM)
       (list 'CHAR (string-to-number $2)))
      ((NUM)
       (list 'LINE (string-to-number $1)))
      ((SLASH STR SLASH)		; doesn't work yet?
       (list 'REGEXP $2))
      ((DOLLAR)
       '(EOF))
      ((DOT)
       '(DOT))
      ((MARK)
       '(MARK))
      )

     )
   'nil)				; no %start declarations
  "Parser automaton for Sam.

The parse tree consists of ((<ADDRESS>) <COMMAND> [ARGS]).
Currently doesn't handle escaped slashes in regexpes (which are
matched as strings by the lexer), spaces in strings etc...")

;; we want a tight command re, one for regexes (until next slash), and one for strings (rest of input)
(defconst sam-command-re
  (rx (char alpha ?= ?< ?> ?| ?! ?{ ?})))

(defconst sam-number-re
  (rx (one-or-more digit))
  "Regexp matching number.")

(defconst sam-string-re
  (rx (* (not (any ?/ space)))))		; allow quoted slashes later

(defconst sam-regexp-re
  (rx (zero-or-more anything ?/)))	; make sure final slash doens't match here

(defconst sam-addr-ops
  '(
    ("#" . POUND)
    ("/" . SLASH)
    ("$" . DOLLAR)
    ("." . DOT)
    ("'" . MARK)
    ("+" . PLUS)
    ("-" . MINUS)
    ("," . COMMA)
    (";" . SEMICOLON)
   ))

;; assumes match data is set
(defun sam-lex-advance-and-return (token)
  (let ((str (match-string 0 input)))
    (setq input (substring input (match-end 0))) ; advance input
    (list token str)))

(defun sam-next-token ()
  (defun is-at (re)
    (string-match (concat "^" re) input)) ; anchor to beginning of string

  (cond 
   ((is-at (rx eos))
    (list wisent-eoi-term))
 ;;   ((is-at sam-command-re)
;;     (sam-lex-advance-and-return 'CMD))
   ;; operator? is this expanded to constant regexp at compile-time? probably not. make it so!
   ((is-at (rx (eval `(or ,@(mapcar 'car sam-addr-ops)))))
    (sam-lex-advance-and-return (cdr (assoc (match-string 0 input) sam-addr-ops))))
   ;; number?
   ((is-at sam-number-re)
    (sam-lex-advance-and-return 'NUM))
   ;; write a specific command rule here that checks lookahead for space or slash
   ((is-at (rx blank))
    (sam-lex-advance-and-return 'SPACE))
   ((is-at sam-string-re)
    (sam-lex-advance-and-return 'STR))
   (t
    (error "Could not reckognize token: %s" input))))

(sam-next-token)

;(wisent-parse sam-table 'sam-next-token)

;;;; Tests
(defmacro assert-equal (expr ans)
  `(unless (equal ,expr ,ans)
     (error "Assertion failed: (equal %S %S), was %S" ',expr ',ans ,expr)))

(assert-equal
 (progn
   (setq input "1,$")
   (wisent-parse sam-table 'sam-next-token))
 '(COMMA (LINE 1) (EOF)))
(assert (let ((input "#4;'"))
	  (equal (wisent-parse sam-table 'sam-next-token)
		 '(SEMICOLON (CHAR 4) (MARK)))))
(assert (let ((input ".+3"))
	  (equal (wisent-parse sam-table 'sam-next-token)
		 '(PLUS (DOT) (LINE 3)))))
(assert-equal 
 (progn
   (setq input "a")
   (wisent-parse sam-table 'sam-next-token))
 '((DOT) a))

(assert-equal 
 (progn
   (setq input "1,2a")
   (wisent-parse sam-table 'sam-next-token))
 '((COMMA (LINE 1) (LINE 2)) a))
(assert-equal 
 (progn
   (setq input "a/string/")
   (wisent-parse sam-table 'sam-next-token))
 '((DOT) a "string"))
(assert-equal 
 (progn
   (setq input "s/string/string2/")
   (wisent-parse sam-table 'sam-next-token))
 '((DOT) s "string" "string2"))
(assert-equal 
 (progn
   (setq input "e filename")
   (wisent-parse sam-table 'sam-next-token))
 '((DOT) e "filename"))
(assert-equal 
 (progn
   (setq input "m 5,8")
   (wisent-parse sam-table 'sam-next-token))
 '((DOT) m (COMMA (LINE 5) (LINE 8))))
