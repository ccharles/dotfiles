;; From Emacs prelude https://github.com/bbatsov/emacs-prelude
(push '("<\\?xml" . nxml-mode) magic-mode-alist)

;; I don't use CUA rectangle mode anymore, but now I'm used to this
;; keybinding!
(add-hook 'nxml-mode-hook
          (lambda ()
            (define-key nxml-mode-map (kbd "C-c C-c") 'nxml-complete)))

(eval-after-load 'nxml-mode
  '(progn
     (setq nxml-child-indent 2)
     (setq nxml-attribute-indent 2)
     (setq nxml-slash-auto-complete-flag t)))
