;; om-theme.el
;;
;; keywords: font, color theme, mode line, highlight

;; srgb colors
(setq ns-use-srgb-colorspace t)

;; font
(defun xs-font () (interactive) (set-frame-font "Consolas-11"))
(defun sm-font () (interactive) (set-frame-font "Consolas-13"))
(defun md-font () (interactive) (set-frame-font "Consolas-15"))
(defun lg-font () (interactive) (set-frame-font "Consolas-17"))
(defun xl-font () (interactive) (set-frame-font "Consolas-19"))
(sm-font)

(use-package solarized-theme
  :ensure t
  :pin melpa
  :config
  (setq solarized-use-variable-pitch nil)
  (setq solarized-high-contrast-mode-line nil)
  (setq solarized-use-less-bold t)
  (setq solarized-scale-org-headlines nil)
  (setq x-underline-at-descent-line t)
  (load-theme 'solarized-dark t)
  (set-face-attribute 'ivy-current-match nil
                      :underline t :bold nil :background "#002b36")
  (set-face-attribute 'region nil :foreground "#93a1a1" :background "#003f4b")
  (set-face-attribute 'show-paren-match nil :weight 'bold)
  (set-cursor-color "white"))

(use-package smart-mode-line
  :ensure t
  :pin melpa
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (sml/setup)
  (set-face-attribute 'mode-line nil :overline "#00232e"
                      :background "#00232e" :box "#00232e")
  (set-face-attribute 'mode-line-inactive nil
                      :background "#073642" :box "#073642")
  (rich-minority-mode 1)
  (setq rm-whitelist '(projectile-mode))
  (setq ring-bell-function
        (lambda ()
          (invert-face 'mode-line)
          (run-with-timer 0.1 nil 'invert-face 'mode-line))))

;; highlight numbers and quotes
(use-package highlight-numbers
  :ensure t
  :defer t
  :pin melpa)

(use-package highlight-quoted
  :ensure t
  :defer t
  :pin melpa)

(use-package paren-face
  :ensure t
  :defer t
  :pin melpa-stable)

(provide 'om-theme)
