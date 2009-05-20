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
		   (setq yas/trigger-key [C-tab])
		   (defvar snippets-dir "~/.snippets/")
		   (if (file-readable-p snippets-dir)
			   (yas/load-directory snippits-dir))))
