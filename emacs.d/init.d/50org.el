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

;; Enable newer Org-mode from AUR
;; (require 'org-install nil t)

(eval-after-load "org"
  '(progn
     (global-set-key "\C-ca" 'org-agenda)
     (setq org-log-done 'time)
     (setq org-clock-out-remove-zero-time-clocks t)
     (setq org-agenda-restore-windows-after-quit t)
     (setq org-agenda-clockreport-parameter-plist
           '(:link t :maxlevel 5 :compact t))
     (setq org-hide-leading-stars t)
     (setq org-odd-levels-only t)

     (org-babel-do-load-languages 'org-babel-load-languages
                                  '((emacs-lisp . t)
                                    (python . t)
                                    (perl . t)))))
