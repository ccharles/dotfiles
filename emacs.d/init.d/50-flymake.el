(add-hook 'find-file-hook 'flymake-find-file-hook)

(global-set-key (kbd "<f5>") 'flymake-goto-next-error)
(global-set-key (kbd "<f6>") 'flymake-display-err-menu-for-current-line)

(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)
(delete '("\\.xml\\'" flymake-xml-init) flymake-allowed-file-name-masks)
