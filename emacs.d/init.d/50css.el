;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50css.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    CSS mode configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq cssm-indent-function 'cssm-c-style-indenter)

(if (fboundp 'rainbow-mode)
    (add-hook 'css-mode-hook
              '(lambda ()
                 (rainbow-mode))))
