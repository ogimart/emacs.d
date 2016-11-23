;; ogimart-look.el
;;
;; uses: solarized-theme, smart-mode-line,
;;       highlight-numbers, highlight-quoted, paren-face

;; srgb colors
(setq ns-use-srgb-colorspace t)

;; font
(set-default-font "Inconsolata-14")

(defun sm-font ()
  (interactive)
  (set-default-font "Inconsolata-13"))

(defun md-font ()
  (interactive)
  (set-default-font "Inconsolata-14"))

(defun lg-font ()
  (interactive)
  (set-default-font "Inconsolata-15"))

;; solarized color theme
(use-package solarized-theme
  :ensure solarized-theme
  :pin melpa
  :config
  (progn
    (load-theme 'solarized-dark t)
    (setq solarized-emphasize-indicators nil)
    (setq solarized-use-less-bold t)
    (setq solarized-scale-org-headlines nil)
    (blink-cursor-mode 0)
    (set-cursor-color "white smoke")))

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

(use-package highlight-numbers
  :ensure t
  :pin melpa)

(use-package highlight-quoted
  :ensure t
  :pin melpa)

(use-package paren-face
  :ensure t
  :pin melpa)

(provide 'ogimart-look)
