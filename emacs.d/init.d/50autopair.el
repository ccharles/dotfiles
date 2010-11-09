;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50autopair.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Autopair configuration file
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "autopair")
    (progn
      ;; Enable autopair globally if it's available.
      (require 'autopair nil t)
      (autopair-global-mode 1)

      ;; Enable wrapping of selected text
      (setq autopair-autowrap t)))