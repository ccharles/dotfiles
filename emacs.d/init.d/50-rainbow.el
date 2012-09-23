(if (locate-library "rainbow-mode")
    (add-hook 'css-mode-hook
              (lambda ()
                (rainbow-mode t))))
