;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50w3m.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    w3m configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "w3m-load")
    (autoload 'w3m "w3m-load"
      "Emacs interface to the w3m web browser" t))
