;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50uniquify.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Uniquify configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Make buffer names more sane
(if (require 'uniquify nil t)
    (setq uniquify-buffer-name-style 'forward))
