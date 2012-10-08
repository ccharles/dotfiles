;; Configuration for Python

(eval-after-load "python"
  '(progn
     (if (require 'pymacs nil t)
         (pymacs-load "ropemacs" "rope-" t))))

;; From http://hide1713.wordpress.com/2009/01/30/
;;                              setup-perfect-python-environment-in-emacs/
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))
