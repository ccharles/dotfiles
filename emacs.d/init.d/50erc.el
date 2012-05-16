;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50erc.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    ERC configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load "erc"
  '(progn
     (require 'erc-services)
     (erc-services-mode 1)

     (setq erc-nick "cccharles")
     (setq erc-user-full-name "Chris Charles")

     ;; From http://nflath.com/2009/10/bitlbee-and-emacs/
     (setq erc-log-channels-directory "~/.emacs.d/erc-logs"
           erc-save-buffer-on-part nil
           erc-save-queries-on-quit nil
           erc-log-write-after-send t
           erc-log-write-after-insert t)

     (erc-log-mode 1)

     (setq erc-autojoin-channels-alist
           '(("freenode.net" "##ninjamonkey" "#gwmm" "#GuelphPHP")))))

(defun my-erc ()
  "Connect to my default ERC servers."
  (interactive)
  (erc-tls :server "irc.freenode.net" :port 7000))
