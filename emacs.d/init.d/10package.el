(if (locate-library "package")
    (eval-after-load "package"
      '(add-to-list 'package-archives
                    '("marmalade" . "http://marmalade-repo.org/packages/"))))
