;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50cua.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    CUA-mode configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Enable CUA rectangle editing
;; http://emacs-fu.blogspot.com/2010/01/rectangles-and-cua.html
(setq cua-enable-cua-keys nil) ;; only for rectangles
(cua-mode t)
