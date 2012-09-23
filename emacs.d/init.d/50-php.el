;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: php.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    PHP-mode setup file.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "php-mode")
    (progn
      (autoload 'php-mode "php-mode"
        "PHP mode" t)
      (setq auto-mode-alist
            (cons '("\\.php$" . php-mode) auto-mode-alist))
      (setq auto-mode-alist
            (cons '("\\.inc$" . php-mode) auto-mode-alist))))
