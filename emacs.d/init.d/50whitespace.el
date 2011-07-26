;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;    Filename: 50whitespace.el
;;      Author: Chris Charles
;;
;; --------------------------------------------------------------------------
;;
;;    Whitespace configuration file for Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (require 'whitespace nil t)
    (progn
      (setq whitespace-display-mappings
            '((space-mark 32
                          [183]
                          [46])
              (space-mark 160
                          [164]
                          [95])
              (space-mark 2208
                          [2212]
                          [95])
              (space-mark 2336
                          [2340]
                          [95])
              (space-mark 3616
                          [3620]
                          [95])
              (space-mark 3872
                          [3876]
                          [95])
              (newline-mark 10
                            [182 10]
                            [36 10])
              (tab-mark 9
                        [187 9]
                        [92 9])))

      (setq whitespace-style
            '(face tabs spaces trailing lines-tail space-before-tab newline indentation
                   empty space-after-tab space-mark tab-mark newline-mark))

      (set-face-attribute 'whitespace-line nil
                          :foreground "unspecified"
                          :background "unspecified"
                          :underline "red")))
