(if (locate-library "magit")
    (progn
      (autoload 'magit-status "magit")
      (global-set-key (kbd "C-x g") 'magit-status)))
