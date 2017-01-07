;; om-look.el
;;
;; uses: solarized-theme, smart-mode-line,
;;       highlight-numbers, highlight-quoted, paren-face

;; srgb colors
(setq ns-use-srgb-colorspace t)

;; font
(set-default-font "Source Code Pro-13")

(use-package noctilux-theme
  :ensure noctilux-theme
  :pin melpa
  :config
  (progn
    (load-theme 'noctilux t)
    (set-face-attribute 'vertical-border
                        nil
                        :foreground "#5f5f5f")
    (blink-cursor-mode 0)
    (set-cursor-color "white")
    (set-mouse-color "white")))

;; mode line
(use-package smart-mode-line
  :ensure t
  :pin melpa
  :config
  (progn
    (setq sml/no-confirm-load-theme t)
    (setq sml/theme 'respectful)
    (sml/setup)
    (setq visible-bell nil)
    (setq ring-bell-function
          (lambda ()
            (invert-face 'mode-line)
            (run-with-timer 0.1 nil 'invert-face 'mode-line)))))

(use-package highlight-numbers
  :ensure t
  :pin melpa)

(use-package highlight-quoted
  :ensure t
  :pin melpa)

(use-package paren-face
  :ensure t
  :pin melpa)

(provide 'om-look)
