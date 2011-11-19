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
(fset 'yes-or-no-p 'y-or-n-p)
(setq indent-tabs-mode nil)

;; X11 Emacs settings
(if window-system
    (progn
      (scroll-bar-mode -1)
      (setq window-columns 77)
      (setq initial-frame-alist '((width . 90) (height . 52)))

      ;; Set the font based on which fonts are available
      (let ((preferred-fonts-list (list)))

            (add-to-list 'preferred-fonts-list
                         "-lispm-fixed-medium-r-normal-*-13-*-*-*-*-*-*-*")
            (add-to-list 'preferred-fonts-list "Envy Code R-10")

		(defun my-set-font (font-list)
		  "Set the font on the current frame to the first font found"

		  ;; set-default-font is deprecated as of Emacs 23.1, but should work
		  ;; in earlier versions
          (if (x-list-fonts (car font-list))
              (set-face-attribute 'default nil :font (car font-list))
			(my-set-font (cdr font-list))))

		(my-set-font preferred-fonts-list))))

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

;; Tabs are evil
(setq-default indent-tabs-mode nil)

;; Enable current line highlighting
(if (fboundp 'global-hl-line-mode)
    (global-hl-line-mode))

;; Cycle the frame size
(defun my-cycle-frame-sizes ()
  (interactive)

  (defun set-frame-size-by-list (size)
    (set-frame-size (selected-frame)
                    (pop size)
                    (pop size)))

  (let ((my-frame-sizes (list (list 90 26)
                              (list 90 52)
                              ;; Workaround for now
                              (list 90 26))))

    (if (member (list (frame-width) (frame-height)) my-frame-sizes)
        (set-frame-size-by-list
         (elt (member (list (frame-width)
                            (frame-height)) my-frame-sizes) 1))

      ;; If we're not on a preset size, default to the first entry
      (set-frame-size-by-list (car my-frame-sizes)))))

;; From http://www.reddit.com/r/emacs/comments/d2t4q/scratch_buffers_for_emacs/c0x7a68
;;
;; Automatically select the appropriate major mode for buffers
(setq default-major-mode (lambda ()
                           (let ((buffer-file-name (or buffer-file-name (buffer-name))))
                             (set-auto-mode))))

;; Single spaces are fine between sentences
(setq sentence-end-double-space nil)

;; Load external config files
(let ((init-folder "~/.emacs.d/init.d"))
  (if (file-readable-p init-folder)
      (dolist (config-file (directory-files init-folder t ".*\.elc?$"))
        (load-file config-file))))
