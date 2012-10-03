;; Set up packages.
;;
;; Preference should be given to using package.el over either
;; operating-system packages or manual site-lisp stuff.

(defun install-base-packages ()
  (require 'package)

  ;; (add-to-list 'package-archives
  ;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)

  (package-refresh-contents)

  ;; TODO: What about updating the local database?
  (let ((value)
        (my-global-packages
         '(ace-jump-mode edit-server expand-region fill-column-indicator
                         js2-mode magit multiple-cursors)))

    (dolist (value my-global-packages)
      (unless (package-installed-p value)
        (package-install value)))))
