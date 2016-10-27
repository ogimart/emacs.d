;; ogimart-look.el
;;
;; uses: solarized-theme, smart-mode-line,
;;       highlight-numbers, highlight-quoted, paren-face

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
    (load-theme 'solarized-light t)
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

(use-package highlight-numbers
  :ensure t
  :pin melpa)

(use-package highlight-quoted
  :ensure t
  :pin melpa)

(use-package paren-face
  :ensure t
  :pin melpa)

(add-hook 'emacs-lisp-mode-hook 'highlight-numbers-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)
(add-hook 'emacs-lisp-mode-hook 'paren-face-mode)

(provide 'ogimart-look)
