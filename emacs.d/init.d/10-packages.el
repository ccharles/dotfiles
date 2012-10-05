;; Set up packages.
;;
;; Preference should be given to using package.el over either
;; operating-system packages or manual site-lisp stuff.

(require 'package)
(package-initialize)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defun install-base-packages ()
  (package-refresh-contents)

  ;; TODO: What about updating the local database?
  (let ((value)
        (my-global-packages
         '(ace-jump-mode drag-stuff edit-server expand-region
                         fill-column-indicator magit multiple-cursors)))

    (dolist (value my-global-packages)
      (unless (package-installed-p value)
        (package-install value)))))
