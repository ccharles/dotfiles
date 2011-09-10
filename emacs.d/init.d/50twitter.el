(add-to-list 'load-path "~/.emacs.d/site-lisp/twittering-mode/")
(if (require 'twittering-mode nil t)
    (progn
      (setq-default twittering-scroll-mode t)
      (setq-default twittering-icon-mode t)

      (setq twittering-initial-timeline-spec-string
      '(":home"
        ":replies"
        ":direct_messages"))))
