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

(if (require 'color-theme-wombat nil t)
    (progn
      (color-theme-wombat)
      (set-face-background 'highlight-current-line-face "grey10")))
