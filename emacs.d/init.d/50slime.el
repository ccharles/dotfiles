;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50slime.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Slime configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "slime")
    (autoload 'slime "slime" nil t))

(eval-after-load "slime"
  '(progn (slime-setup)
          (setq inferior-lisp-program "/usr/bin/clisp")))
