;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50batch-mode.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Batch mode configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (require 'batch-mode nil t)
    (add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode)))
