;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50cperl.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    CPerl configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'perl-mode 'cperl-mode)
(setq cperl-electric-keywords nil) ; Do not expand Perl keywords

(add-hook 'cperl-mode-hook
          '(lambda ()
             (cperl-set-style "PerlStyle")))
