(autoload 'fci-mode "fill-column-indicator" nil t)

(eval-after-load "fill-column-indicator"
  '(progn
     (setq fci-rule-column 80)))

(add-hook 'after-change-major-mode-hook '(lambda ()
                                           (if (locate-library "fill-column-indicator")
                                               (fci-mode))))
