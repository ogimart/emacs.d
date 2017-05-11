;; om-core.el
;;
;; keywords: flx, fuzzy, ivy, indent
;;           mode line, font, highlight

;; fuzzy search
(use-package flx
  :ensure t
  :defer t)

;; ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)
  (setq ivy-format-function 'ivy-format-function-arrow))

;; white space
(use-package whitespace
  :diminish whitespace-mode
  :config
  (add-hook 'prog-mode-hook 'whitespace-mode)
  (setq-default whitespace-line-column 100
                whitespace-style '(face lines-tail trailing)))

;; indentation
(use-package aggressive-indent
  :ensure t
  :defer t
  :pin melpa)

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
  (load-theme 'solarized-light t)
  (set-face-attribute 'show-paren-match nil :weight 'bold)
  (set-face-foreground 'ivy-minibuffer-match-face-1 "#dc322f")
  (set-face-foreground 'ivy-minibuffer-match-face-2 "#dc322f")
  (set-face-foreground 'ivy-minibuffer-match-face-3 "#dc322f")
  (set-face-foreground 'ivy-minibuffer-match-face-4 "#dc322f")
  (blink-cursor-mode 0))

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
  :pin melpa)

(use-package highlight-quoted
  :ensure t
  :pin melpa)

(use-package paren-face
  :ensure t
  :pin melpa-stable)

(provide 'om-core)
