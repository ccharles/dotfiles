;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50color-theme.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Color-theme configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (if (require 'color-theme-wombat nil t)
;;     (progn
;;       (color-theme-wombat)

;;       ; Linum mode should blend in better
;;       (eval-after-load "linum"
;;         '(progn
;;            (set-face-background 'linum "grey10")
;;            (set-face-foreground 'linum "grey25")))

;;       ; Make hl-line-mode look OK with wombat
;;       (eval-after-load "hl-line"
;;         '(set-face-background 'hl-line "grey10"))

;;       ; Make cperl hashes and arrays look OK with wombat
;;       (eval-after-load "cperl-mode"
;;         '(progn
;;            (set-face-background 'cperl-array-face nil)
;;            (set-face-foreground 'cperl-array-face "#cae682")
;;            (set-face-background 'cperl-hash-face nil)
;;            (set-face-foreground 'cperl-hash-face "#cae682")))

;;       ; Make the whitespace characters look OK with wombat
;;       (eval-after-load "whitespace"
;;         '(progn
;;            (set-face-background 'whitespace-space nil)
;;            (set-face-foreground 'whitespace-space "grey30")
;;            (set-face-background 'whitespace-newline nil)
;;            (set-face-foreground 'whitespace-newline "grey30")
;;            (set-face-background 'whitespace-tab nil)
;;            (set-face-foreground 'whitespace-tab "grey30")
;;            (set-face-background 'whitespace-indentation nil)
;;            (set-face-foreground 'whitespace-indentation "grey30")))

;;       ; Make ERC prompt readable
;;       (eval-after-load "erc"
;;         '(progn
;;            (set-face-background 'erc-prompt-face nil)
;;            (set-face-foreground 'erc-prompt-face "lightBlue2")))))
