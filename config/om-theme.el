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

(use-package zenburn-theme
  :ensure t
  :pin melpa
  :config
  (load-theme 'zenburn t)
  (set-face-foreground 'vertical-border "#656555")
  (set-face-background 'fringe "#3f3f3f")
  (set-face-attribute 'show-paren-match nil :weight 'normal :underline t
                      :foreground "white" :background "#3f3f3f")
  (set-face-attribute 'ivy-current-match nil :weight 'normal :underline t)
  (set-face-attribute 'ivy-minibuffer-match-face-1 nil
                      :foreground "#8cd0d3" :background "#3f3f3f")
  (set-face-attribute 'ivy-minibuffer-match-face-2 nil
                      :foreground "#8cd0d3" :background "#3f3f3f")
  (set-face-attribute 'ivy-minibuffer-match-face-3 nil
                      :foreground "#8cd0d3" :background "#3f3f3f")
  (set-face-attribute 'ivy-minibuffer-match-face-4 nil
                      :foreground "#8cd0d3" :background "#3f3f3f"))

(use-package smart-mode-line
  :ensure t
  :pin melpa
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (sml/setup)
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
