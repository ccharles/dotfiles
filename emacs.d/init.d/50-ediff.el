;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50ediff.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Ediff configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Use Ediff in one frame
(eval-after-load "ediff"
  '(set-variable 'ediff-window-setup-function 'ediff-setup-windows-plain))
