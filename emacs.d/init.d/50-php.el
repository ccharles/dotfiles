;; PHP config

(add-to-list 'auto-mode-alist
             '("\\.php[45]?\\'" . php+-mode))

(autoload 'php+-mode "php+-mode")
(eval-after-load "php+-mode"
  '(php+-mode-setup))
