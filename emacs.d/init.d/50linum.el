;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50color-theme.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Color-theme configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load "linum"
  (setq linum-format "%5d"))

(if (require 'linum nil t)
    (global-linum-mode))
