;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename : .emacs
;;      Author : Chris Charles
;;   Time-stamp: "2008-10-26 11:53:53 chris"
;;
;; --------------------------------------------------------------------------
;;
;;   Snippets stolen from
;;      http://www.steve.org.uk/Reference/Snippets/emacs.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ;; (if (file-exists-p "~/.emacs.d/site-lisp/js2-20080424.elc")
;; ;;	(progn
;; ;;	  (message "Loading js2-mode.")
;; ;;	  (load-file "~/.emacs.d/site-lisp/js2-20080424.elc")))

;; No startup message
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
(if window-system
	(scroll-bar-mode -1))
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
(setq cperl-electric-keywords t) ; Expand Perl keywords
(defun chris-cperl-mode-hook ()
  (cperl-set-style "PerlStyle"))
(add-hook 'cperl-mode-hook 'chris-cperl-mode-hook)

;; NXML Mode
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

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(erc-prompt-face ((t (:foreground "lightBlue2" :weight bold))))
 '(highlight-current-line-face ((t (:background "#090909"))))
 '(mode-line ((t (:background "darkslateblue" :foreground "yellow" :box (:line-width -1 :style released-button)))))
 '(region ((t (:background "gray20"))))
 '(show-paren-match ((t (:background "#363"))))
 '(show-paren-mismatch ((((class color)) (:background "#633"))))
 '(whitespace-newline ((t (:foreground "#122"))))
 '(whitespace-space ((((class color) (background dark)) (:foreground "#122"))))
 '(whitespace-tab ((nil (:foreground "#122")))))

(server-start)

(windmove-default-keybindings)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(whitespace-chars (quote (tabs spaces trailing newline lines-tail space-before-tab empty space-after-tab))))


(require 'tramp)
(add-to-list 'tramp-default-proxies-alist
             '("\\.ouac\\.on\\.ca\\'" nil "/ssh:ssh.ouac.on.ca:"))
(add-to-list 'tramp-default-proxies-alist
             '("\\`ssh\\.ouac\\.on\\.ca\\'" nil nil))

(require 'whitespace)
;(global-whitespace-mode)

(highlight-current-line-on t)

; Fix the whitespace display mappings
(setq whitespace-display-mappings '((32
  [183]
  [46])
 (160
  [164]
  [95])
 (2208
  [2212]
  [95])
 (2336
  [2340]
  [95])
 (3616
  [3620]
  [95])
 (3872
  [3876]
  [95])
 (10
  ; End of lines should be paragraph marks, not $s
  ; [36 10])
  [182 10])
 (9
  [187 9]
  [92 9])))

(when window-system
  (setq window-columns 77)
  (require 'color-theme)
  (color-theme-clarity)
  (setq initial-frame-alist '((width . 80) (height . 26)))
  (mouse-avoidance-mode 'banish))

; SLIME
(setq inferior-lisp-program "/usr/bin/clisp")
(require 'slime)
(slime-setup)

(show-paren-mode)

(put 'set-goal-column 'disabled nil)
(global-set-key "\C-ca" 'org-agenda)

(put 'narrow-to-region 'disabled nil)

(add-to-list 'load-path
			 "~/.emacs.d/site-lisp/")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.snippets/")
(setq yas/trigger-key [C-tab])