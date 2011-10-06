(if (locate-library "ace-jump-mode")
    (progn
      (autoload 'ace-jump-mode "ace-jump-mode")
      (define-key global-map (kbd "<insert>") 'ace-jump-mode)))
