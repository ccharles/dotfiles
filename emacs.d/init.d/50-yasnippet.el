;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50yasnippet.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    yasnippet configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (require 'yasnippet nil t)
    (progn (yas/initialize)
           ;; This doesn't seem to work for some reason...
           ;; (setq yas/trigger-key (kbd "C-<tab>"))
           (yas/load-directory "/usr/share/emacs/site-lisp/yas/snippets")
           (defvar local-snippets-dir "~/.snippets")
           (if (file-readable-p local-snippets-dir)
               (yas/load-directory local-snippets-dir))))
