;; From Emacs prelude https://github.com/bbatsov/emacs-prelude
(push '("<\\?xml" . nxml-mode) magic-mode-alist)

;; CUA-rectangle mode clobbers the default X11 C-Return binding for
;; nxml-complete, so let's use C-c C-c which doesn't appear to be used in
;; nxml-mode.
(add-hook 'nxml-mode-hook
          (lambda ()
            (define-key nxml-mode-map (kbd "C-c C-c") 'nxml-complete)))

(eval-after-load 'nxml-mode
  '(progn
     (setq nxml-child-indent 2)
     (setq nxml-attribute-indent 2)
     (setq nxml-slash-auto-complete-flag t)))
