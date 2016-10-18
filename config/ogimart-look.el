;; ogimart-look.el
;;
;; uses: solarized-theme, smart-mode-line

;; srgb colors
(setq ns-use-srgb-colorspace t)

;; font
(set-default-font "Inconsolata-14")

;; solarized color theme
(use-package solarized-theme
  :ensure solarized-theme
  :pin melpa
  :config
  (progn
    (load-theme 'solarized-dark t)
    (setq solarized-emphasize-indicators nil)
    (setq solarized-use-less-bold t)
    (set-face-attribute 'region nil
                        :background "#073642"
                        :foreground "#eee8d5")
    (set-cursor-color "#fdf6e3")
    (blink-cursor-mode 0)))

;; mode line
(use-package smart-mode-line
  :ensure t
  :pin melpa
  :config
  (progn
    (setq sml/no-confirm-load-theme t)
    (setq sml/theme 'respectful)
    (sml/setup)
    (setq solarized-high-contrast-mode-line t)))

(provide 'ogimart-look)
