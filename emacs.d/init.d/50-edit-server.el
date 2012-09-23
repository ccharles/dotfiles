;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50edit-server.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Load edit-server.el for Chrome's edit with Emacs extension.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (require 'edit-server nil t)
	(progn
	  (setq edit-server-new-frame nil)
	  (edit-server-start)))
