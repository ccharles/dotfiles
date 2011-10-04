(if (locate-library "deft")
    (progn
      (autoload 'deft "deft" nil t)
      (global-set-key [f12] 'deft)))

(eval-after-load "deft"
  '(progn
     (setq deft-extension "org")
     (setq deft-directory "~/SparkleShare/sparkleshare/deft/")
     (setq deft-use-filename-as-title t)
     (setq deft-text-mode 'org-mode)))
