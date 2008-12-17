;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename : .emacs
;;      Author : Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;   References
;;      - http://www.steve.org.uk/Reference/Snippets/emacs.html
;;      - http://a-nickels-worth.blogspot.com/2007/11/effective-emacs.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; No startup message
(setq inhibit-startup-message t)

;; My lisp files live here
(add-to-list 'load-path
			 "~/.emacs.d/site-lisp/")

(global-font-lock-mode t)
(display-time-mode t)
(setq column-number-mode t)
(setq transient-mark-mode t)
(setq scroll-step 1)
(setq-default fill-column 77)
(setq default-tab-width 4)
(menu-bar-mode -1)
(tool-bar-mode -1)

; css-mode options
(setq cssm-indent-function 'cssm-c-style-indenter)

; Replace yes-or-no with y-or-n
(fset 'yes-or-no-p 'y-or-n-p)
(setq indent-tabs-mode nil)

;; Timestamp before saving
(add-hook 'before-save-hook 'time-stamp)

;; Text Mode
(defun chris-text-mode-hook ()
  (setq indent-tabs-mode nil))
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'chris-text-mode-hook)

; CPerl Mode
(fset 'perl-mode 'cperl-mode)
(setq cperl-electric-keywords nil) ; Do not expand Perl keywords
(defun chris-cperl-mode-hook ()
  (cperl-set-style "PerlStyle"))
(add-hook 'cperl-mode-hook 'chris-cperl-mode-hook)

;; Use NXML mode for HTML
(fset 'html-mode 'nxml-mode)



;; C++ Mode
(add-hook 'c++-mode-hook
		  '(lambda ()
			 (c-set-style "awk")))

; Printing
(setq ps-paper-type 'letter
	  ps-line-number t
	  ps-print-header-frame nil
	  ps-landscape-mode t
	  ps-number-of-columns 2)

; Copied from http://wiki.asleep.net/wiki/My_Dot_Emacs
;; Make executable scripts +x on save
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; ; Nuke whitespace before saving
;; ;; (autoload 'nuke-trailing-whitespace "nuke-trailing-whitespace" nil t)
;; ;; (add-hook 'write-file-hooks 'nuke-trailing-whitespace)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(windmove-default-keybindings 'control)

(require 'tramp)
(add-to-list 'tramp-default-proxies-alist
             '("\\.ouac\\.on\\.ca\\'" nil "/ssh:ssh.ouac.on.ca:"))
(add-to-list 'tramp-default-proxies-alist
             '("\\`ssh\\.ouac\\.on\\.ca\\'" nil nil))

(require 'whitespace)
;(global-whitespace-mode)
(setq whitespace-display-mappings
	  '((space-mark 32
					[183]
					[46])
		(space-mark 160
					[164]
					[95])
		(space-mark 2208
					[2212]
					[95])
		(space-mark 2336
					[2340]
					[95])
		(space-mark 3616
					[3620]
					[95])
		(space-mark 3872
					[3876]
					[95])
		(newline-mark 10
					  [182 10]
					  [36 10])
		(tab-mark 9
				  [187 9]
				  [92 9])))

(highlight-current-line-on t)

(when window-system
  (scroll-bar-mode nil)
  (setq window-columns 77)
  (autoload 'color-theme-clarity "color-theme" t)
  (color-theme-clarity)
  (setq initial-frame-alist '((width . 80) (height . 26))))

;; ; SLIME
;; (setq inferior-lisp-program "/usr/bin/clisp")
;; (require 'slime)
;; (slime-setup)

(show-paren-mode)

(put 'set-goal-column 'disabled nil)
(global-set-key "\C-ca" 'org-agenda)

(put 'narrow-to-region 'disabled nil)

(require 'yasnippet)
(eval-after-load "yasnippet"
  '(progn
	 (yas/initialize)
	 (yas/load-directory "~/.snippets/")
	 (setq yas/trigger-key [C-tab])))

(gnuserv-start)

; Thanks to M-x all-things-emacs
; http://www.emacsblog.org/2008/12/06/quick-tip-detaching-the-custom-file/
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
