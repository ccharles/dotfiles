(if (locate-library "package")
    (eval-after-load "package"
      '(progn
         (add-to-list 'package-archives
                      '("marmalade" . "http://marmalade-repo.org/packages/") t)
         (add-to-list 'package-archives
                      '("melpa" . "http://melpa.milkbox.net/packages/") t))))
