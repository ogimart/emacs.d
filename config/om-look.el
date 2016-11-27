;; om-look.el
;;
;; uses: solarized-theme, smart-mode-line,
;;       highlight-numbers, highlight-quoted, paren-face

;; srgb colors
(setq ns-use-srgb-colorspace t)

;; font
(set-default-font "Inconsolata-14")

(use-package zenburn-theme
  :ensure zenburn-theme
  :pin melpa
  :config
  (progn
    (load-theme 'zenburn t)
    (set-foreground-color "#D6D6D6")
    (set-face-attribute 'show-paren-match-face nil
                        :foreground "white smoke"
                        :background "#6F6F6F")
    (set-face-attribute 'vertical-border
                        nil
                        :foreground "#6F6F6F")
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
