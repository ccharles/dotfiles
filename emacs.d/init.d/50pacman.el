(if (locate-library "pkgbuild-mode")
    (progn
      (autoload 'pkgbuild-mode "pkgbuild-mode" nil t)
      (add-to-list 'auto-mode-alist '("PKGBUILD$" . pkgbuild-mode))
      (add-to-list 'auto-mode-alist '("\\.install$" . pkgbuild-mode))))
