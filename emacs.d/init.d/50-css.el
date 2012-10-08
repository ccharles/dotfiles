(setq cssm-indent-function 'cssm-c-style-indenter)

(if (locate-library "rainbow-mode")
    (add-hook 'css-mode-hook
              '(lambda ()
                 (rainbow-mode))))
