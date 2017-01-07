;; om-look.el
;;
;; uses: solarized-theme, smart-mode-line,
;;       highlight-numbers, highlight-quoted, paren-face

;; srgb colors
(setq ns-use-srgb-colorspace t)

;; font
(set-frame-font "-*-Source Code Pro-light-normal-normal-*-13-*-*-*-m-0-iso10646-1")

(use-package noctilux-theme
  :ensure noctilux-theme
  :pin melpa
  :config
  (progn
    (load-theme 'noctilux t)
    (set-face-attribute 'vertical-border
                        nil
                        :foreground "#5F5F5F")
    (set-face-attribute 'show-paren-match-face nil
                        :background "#5F5F5F")
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
    (setq sml/theme 'dark)
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
