(add-to-list 'load-path "~/.emacs.d/site-lisp/twittering-mode/")
(if (locate-library "twittering-mode")
    (autoload 'twit "twittering-mode" nil t))

(eval-after-load "twittering-mode"
  '(progn
     (setq-default twittering-scroll-mode t)
     (setq-default twittering-icon-mode t)

     (setq twittering-initial-timeline-spec-string
           '(":home"
             ":replies"
             ":direct_messages"))))
