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

(if (locate-library "windmove")
    (progn
      (autoload 'windmove-left "windmove")
      (autoload 'windmove-right "windmove")
      (autoload 'windmove-up "windmove")
      (autoload 'windmove-down "windmove")

      (global-set-key [left] 'windmove-left)
      (global-set-key [right] 'windmove-right)
      (global-set-key [up] 'windmove-up)
      (global-set-key [down] 'windmove-down)))
