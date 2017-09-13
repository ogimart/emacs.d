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

(use-package material-theme
  :ensure t
  :pin melpa
  :config
  (load-theme 'material t)
  (set-cursor-color "white")
  (set-face-attribute 'show-paren-match-face nil :bold nil :underline t
                      :background "#263238" :foreground "white")
  (set-face-attribute 'show-paren-mismatch-face nil :bold nil :underline t
                      :background "#263238" :foreground "red"))

(use-package smart-mode-line
  :ensure t
  :pin melpa
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (sml/setup)
  (rich-minority-mode 1)
  (setq rm-whitelist '(projectile-mode))
  (set-face-attribute 'mode-line nil :background "#37474F"
                      :box '(:line-width -1 :color "#555555"))
  (set-face-attribute 'mode-line-inactive nil :background "#546E7A"
                      :box '(:line-width -1 :color "#555555"))
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
