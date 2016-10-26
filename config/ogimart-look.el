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
    ;; light
    (load-theme 'solarized-light t)

    ;; dark
    ;; (load-theme 'solarized-dark t)
    ;; (set-cursor-color "#fdf6e3")

    ;; settings
    (setq solarized-emphasize-indicators nil)
    (setq solarized-use-less-bold t)
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
    (setq solarized-high-contrast-mode-line t)
    (setq visible-bell nil)
    (setq ring-bell-function
          (lambda ()
            (invert-face 'mode-line)
            (run-with-timer 0.1 nil 'invert-face 'mode-line)))))

(provide 'ogimart-look)
