;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50windmove.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Windmove configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (require 'windmove)
    (progn
      (global-set-key [left] 'windmove-left)
      (global-set-key [right] 'windmove-right)
      (global-set-key [up] 'windmove-up)
      (global-set-key [down] 'windmove-down)))
