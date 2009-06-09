;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50org.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Org mode configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-ca" 'org-agenda)
(eval-after-load "org"
  '(setq org-log-done 'time))
(eval-after-load "org"
  '(setq org-agenda-restore-windows-after-quit t))
