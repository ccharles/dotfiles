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

(if (require 'slime nil t)
	(progn (slime-setup)
		   (setq inferior-lisp-program "/usr/bin/clisp")))
