;; Site-local Emacs settings.

;; Set up TRAMP proxies
;;
;; (if (locate-library "tramp")
;;     (eval-after-load "tramp"
;;       '(add-to-list 'tramp-default-proxies-alist
;;                     '("\\`my\\.server\\.tld\\'"
;;                       "\\`my-user\\'"
;;                       "/ssh:%h:"))))

;; Font for this system
;; (add-to-list 'default-frame-alist
;;              (cons 'font "Ubuntu Mono-10"))
