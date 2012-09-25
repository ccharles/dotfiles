;; Master Emacs init file.
;;
;; Part of a massive rewrite begun on 2012-09-25.

;; Load external config files
(let ((init-folder "~/.emacs.d/init.d"))
  (if (file-readable-p init-folder)
      (dolist (config-file (directory-files init-folder t ".*\.elc?$"))
        (load-file config-file))))
