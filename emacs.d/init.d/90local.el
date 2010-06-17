;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 90local.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Site-local Emacs settings.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set up TRAMP proxies
;;
;; (if (locate-library "tramp")
;;     (eval-after-load "tramp"
;;       '(add-to-list 'tramp-default-proxies-alist
;;                     '("\\`my\\.server\\.tld\\'"
;;                       "\\`my-user\\'"
;;                       "/ssh:%h:"))))
