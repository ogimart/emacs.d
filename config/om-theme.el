;; om-theme.el
;;
;; keywords: font, color theme, mode line, highlight

;; srgb colors & transparency
(setq ns-use-srgb-colorspace t)
;; (set-frame-parameter (selected-frame) 'alpha '(92 . 92))
;; (add-to-list 'default-frame-alist '(alpha . (92 . 92)))
;; (add-to-list 'default-frame-alist '(ns-appearance . dark))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

(defun sm-font () (interactive) (set-frame-font "Fira Code-11"))
(defun md-font () (interactive) (set-frame-font "Fira Code-13"))
(defun lg-font () (interactive) (set-frame-font "Fira Code-15"))

(setq geom-x (nth 3 (caar (display-monitor-attributes-list))))
(cond ((eq geom-x 1440) (sm-font))
      ((eq geom-x 1680) (md-font))
      ((eq geom-x 2560) (md-font))
      (t (sm-font)))
(mac-auto-operator-composition-mode)

;; theme
(use-package nord-theme
  :ensure t
  :config
  (setq nord-comment-brightness 20)
  (load-theme 'nord t)
  ; (set-cursor-color "white")
  )

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
