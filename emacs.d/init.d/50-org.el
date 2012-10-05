(eval-after-load "org"
  '(progn
     (global-set-key "\C-ca" 'org-agenda)
     (setq org-log-done 'time)
     (setq org-clock-out-remove-zero-time-clocks t)
     (setq org-agenda-restore-windows-after-quit t)
     (setq org-agenda-clockreport-parameter-plist
           '(:link t :maxlevel 5 :compact t))

     (org-babel-do-load-languages 'org-babel-load-languages
                                  '((emacs-lisp . t)
                                    (python . t)
                                    (perl . t)))))
