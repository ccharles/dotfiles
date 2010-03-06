;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50vc.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Version control mode configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Git should be the preferred VC backend (particularly it should be preferred
; over CVS)
(if (require 'vc nil t)
	(set 'vc-handled-backends
		 '(Git RCS CVS SVN SCCS Bzr Hg Mtn Arch)))
