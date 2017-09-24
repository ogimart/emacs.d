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
(use-package solarized-theme
  :ensure t
  :pin melpa
  :config
  (setq solarized-use-less-bold nil)
  (setq solarized-use-variable-pitch nil)
  (setq solarized-scale-org-headlines nil)
  (setq solarized-height-minus-1 1.0)
  (setq solarized-height-plus-1 1.0)
  (setq solarized-height-plus-2 1.0)
  (setq solarized-height-plus-3 1.0)
  (setq solarized-height-plus-4 1.0)
  (load-theme 'solarized-light t)
  (set-face-foreground 'ivy-minibuffer-match-face-1 "#dc322f")
  (set-face-foreground 'ivy-minibuffer-match-face-2 "#dc322f")
  (set-face-foreground 'ivy-minibuffer-match-face-3 "#dc322f")
  (set-face-foreground 'ivy-minibuffer-match-face-4 "#dc322f"))

(use-package smart-mode-line
  :ensure t
  :pin melpa
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (sml/setup)
  (set-face-attribute 'mode-line nil :overline "#f4f4f4"
                      :background "#f4f4f4" :box "#eee8d5")
  (set-face-attribute 'mode-line-inactive nil
                      :background "#eee8d5" :box "#eee8d5")
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
