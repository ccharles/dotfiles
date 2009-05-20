;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50shell.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Shell configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Prevent M-x shell from clobbering windmove bindings
(eval-after-load "shell" '(define-key shell-mode-map (kbd "<C-up>") nil))
(eval-after-load "shell" '(define-key shell-mode-map (kbd "<C-down>") nil))

; Make M-x shell work with ANSI colours
(eval-after-load "shell" '(ansi-color-for-comint-mode-on))
