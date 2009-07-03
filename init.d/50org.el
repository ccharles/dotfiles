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

(eval-after-load "org"
  '(progn
     (global-set-key "\C-ca" 'org-agenda)
     (setq org-log-done 'time)
     (setq org-agenda-restore-windows-after-quit t)
     (setq org-hide-leading-stars t)
     (setq org-odd-levels-only t)))
