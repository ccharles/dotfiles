;; Global Emacs settings.

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

;; Avoid the minibuffer read-only message
;; http://www.reddit.com/r/emacs/comments/yn3u3/
;;     fixing_text_read_only_when_cursor_accidentally/
(setq minibuffer-prompt-properties
      (plist-put minibuffer-prompt-properties
                 'point-entered 'minibuffer-avoid-prompt))

(setq default-frame-alist
      (list (cons 'reverse t)           ; Use reverse video.
                                        ; See http://lists.gnu.org/archive/
                                        ;    html/help-gnu-emacs/2002-10/
                                        ;    msg00040.html
            (cons 'width 90)
            (cons 'height 52)
            (cons 'horizontal-scroll-bars nil)
            (cons 'vertical-scroll-bars nil)

			default-frame-alist))

;; Separate the custom file
;; http://www.emacsblog.org/2008/12/06/quick-tip-detaching-the-custom-file/
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Have to load the theme after dealing with custom-file
(load-theme 'cyberpunk)

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

;; From http://www.reddit.com/r/emacs/comments/d2t4q/scratch_buffers_for_emacs/c0x7a68
;;
;; Automatically select the appropriate major mode for buffers
(setq default-major-mode (lambda ()
                           (let ((buffer-file-name (or buffer-file-name (buffer-name))))
                             (set-auto-mode))))

;; Single spaces are fine between sentences
(setq sentence-end-double-space nil)

;; Window management
(if (locate-library "windmove")
    (progn
      (autoload 'windmove-left "windmove")
      (autoload 'windmove-right "windmove")
      (autoload 'windmove-up "windmove")
      (autoload 'windmove-down "windmove")

      (global-set-key [left] 'windmove-left)
      (global-set-key [right] 'windmove-right)
      (global-set-key [up] 'windmove-up)
      (global-set-key [down] 'windmove-down)))

(winner-mode t)

;; Buffer management
(if (require 'uniquify nil t)
    (setq uniquify-buffer-name-style 'forward))

(ido-mode 1)

(which-function-mode 1)

;; Show empty linesin the fringe
(setq default-indicate-empty-lines t)

;; Whitespace settings
(if (locate-library "whitespace")
    (autoload 'whitespace-mode "whitespace" nil t))

(eval-after-load "whitespace"
    '(progn
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

       (setq whitespace-style
             '(face tabs spaces trailing space-before-tab newline indentation
                    empty space-after-tab space-mark tab-mark newline-mark))))

;; Use the user's default browser to open URLs
(setq-default browse-url-generic-program "xdg-open")
(setq-default browse-url-browser-function 'browse-url-generic)


;; A bunch of plugins that I always want.

(if (locate-library "ace-jump-mode")
    (progn
      (autoload 'ace-jump-mode "ace-jump-mode")
      (define-key global-map (kbd "<insert>") 'ace-jump-mode)))

(if (locate-library "ack-and-a-half")
    ;; TODO: Leverage ack-and-a-half code to determine whether the binaries
    ;; are available
    (if (or (executable-find "ack")
            (executable-find "ack-grep"))
        (progn
          ;; TODO: Get this working with autoload... Having a bit of trouble
          ;; with it. I don't want to bind keys, but simply to make, e.g.,
          ;; 'ack-and-a-half executable via M-x.
          (require 'ack-and-a-half)

          (defalias 'ack 'ack-and-a-half)
          (defalias 'ack-same 'ack-and-a-half-same)
          (defalias 'ack-find-file 'ack-and-a-half-find-file)
          (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same))
      (message "Could not find ack binary")))

(if (require 'auto-complete-config)
    (progn
      (setq-default ac-sources '(ac-source-words-in-same-mode-buffers
                                 ac-source-css-property ac-source-yasnippet
                                 ac-source-dictionary ac-source-gtags))

      (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
      (add-hook 'css-mode-hook 'ac-css-mode-setup)
      (add-hook 'auto-complete-mode-hook 'ac-common-setup)

      (global-auto-complete-mode t)))

(if (require 'autopair nil t)
    (progn
      ;; Enable autopair globally if it's available.
      (autopair-global-mode 1)

      ;; Don't want autopair in js2-mode...
      (add-hook 'js2-mode-hook '(lambda () (setq autopair-dont-activate t)))

      ;; ...or any term modes.
      (add-hook 'term-mode-hook '(lambda () (setq autopair-dont-activate t)))))

(if (locate-library "drag-stuff")
    (progn
      (drag-stuff-global-mode t)
      (add-hook 'org-mode-hook
                (lambda () (drag-stuff-mode -1)))))

(if (require 'edit-server nil t)
	(progn
	  (setq edit-server-new-frame nil)
	  (edit-server-start)))

(if (locate-library "expand-region")
    (progn
      (autoload 'er/expand-region "expand-region")
      (global-set-key (kbd "C-=") 'er/expand-region)))

(if (locate-library "magit")
    (progn
      (autoload 'magit-status "magit")
      (global-set-key (kbd "C-x g") 'magit-status)))

(if (locate-library "multiple-cursors")
    (progn
      (autoload 'mc/mark-next-like-this "multiple-cursors")
      (autoload 'mc/mark-previous-like-this "multiple-cursors")
      (autoload 'mc/mark-all-like-this "multiple-cursors")

      (global-set-key (kbd "C->") 'mc/mark-next-like-this)
      (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
      (global-set-key (kbd "C-*") 'mc/mark-all-like-this)))

(if (require 'yasnippet nil t)
    (let ((local-snippets-dir "~/.emacs.d/snippets/"))
      (if (file-readable-p local-snippets-dir)
          (yas-load-directory local-snippets-dir))
      (yas-global-mode 1)))
