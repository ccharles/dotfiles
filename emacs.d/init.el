;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename : init.el
;;      Author : Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;   References
;;      - http://www.steve.org.uk/Reference/Snippets/emacs.html
;;      - http://a-nickels-worth.blogspot.com/2007/11/effective-emacs.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Main Emacs settings
(setq inhibit-startup-message t)
(global-font-lock-mode t)
(display-time-mode t)
(setq column-number-mode t)
(setq transient-mark-mode t)
(setq scroll-step 1)
(setq-default fill-column 77)
(setq default-tab-width 4)
(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode)
(highlight-current-line-on t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq indent-tabs-mode nil)

;; X11 Emacs settings
(if (window-system)
    (progn
      (scroll-bar-mode nil)
      (setq window-columns 77)
      (setq initial-frame-alist '((width . 80) (height . 26)))))

; Copied from http://wiki.asleep.net/wiki/My_Dot_Emacs
;; Make executable scripts +x on save
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; Separate the custom file
;; http://www.emacsblog.org/2008/12/06/quick-tip-detaching-the-custom-file/
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Consolidate backup files
;; http://benno.id.au/blog/2008/02/26/emacs-backup-files
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; Enable some features
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; Local lisp files live here
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; Load external config files
(let ((init-folder "~/.emacs.d/init.d"))
  (if (file-readable-p init-folder)
      (dolist (config-file (directory-files init-folder t ".*\.elc?$"))
        (load-file config-file))))
