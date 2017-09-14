;; om-theme.el
;;
;; keywords: font, color theme, mode line, highlight

;; srgb colors
(setq ns-use-srgb-colorspace t)

;; font
(defun xs-font () (interactive) (set-frame-font "Ubuntu Mono-12"))
(defun sm-font () (interactive) (set-frame-font "Ubuntu Mono-14"))
(defun md-font () (interactive) (set-frame-font "Ubuntu Mono-16"))
(defun lg-font () (interactive) (set-frame-font "Ubuntu Mono-18"))
(defun xl-font () (interactive) (set-frame-font "Ubuntu Mono-20"))
(sm-font)

;; theme
(setq current-t43m3 nil)

(defun customize-theme ()
  (setq solarized-use-less-bold nil)
  (setq solarized-use-variable-pitch nil)
  (setq solarized-scale-org-headlines nil)
  (setq solarized-height-minus-1 1.0)
  (setq solarized-height-plus-1 1.0)
  (setq solarized-height-plus-2 1.0)
  (setq solarized-height-plus-3 1.0)
  (setq solarized-height-plus-4 1.0))

(defun enab-theme (theme)
  (if current-t43m3 (disable-theme current-t43m3))
  (setq current-t43m3 theme)
  (customize-theme)
  (load-theme theme t))

(defun sl-theme ()
  (interactive)
  (enab-theme 'solarized-light))

(defun sd-theme ()
  (interactive)
  (enab-theme 'solarized-dark))

(use-package solarized-theme
  :ensure t
  :pin melpa
  :config
  (sl-theme))

(use-package smart-mode-line
  :ensure t
  :pin melpa
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (sml/setup)
  (rich-minority-mode 1)
  (setq rm-whitelist '(projectile-mode))
  (setq x-underline-at-descent-line t)
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
