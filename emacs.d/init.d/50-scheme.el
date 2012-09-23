;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50scheme.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Emacs scheme configuration.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "xscheme")
    (autoload 'start-scheme "xscheme"
      "MIT/GNU Scheme inteface" t))
