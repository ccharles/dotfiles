;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50lua-mode.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Lua-mode configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "lua-mode")
    (progn
      (autoload 'lua-mode "lua-mode" "Lua mode" t)
      (setq auto-mode-alist
            (cons '("\\.lua$" . lua-mode) auto-mode-alist))))
