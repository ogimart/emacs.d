;; om-core.el
;;
;; keywords: ido, flx-ido, fuzzy, indent
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
  ;; (set-face-attribute 'ivy-current-match nil
  ;;                     :background "SteelBlue2")
  (setq ivy-format-function 'ivy-format-function-arrow))

;; white space
(use-package whitespace
  :init
  (add-hook 'prog-mode-hook 'whitespace-mode)
  :config
  (setq-default whitespace-line-column 100
                whitespace-style '(face lines-tail trailing))
  :diminish whitespace-mode)

;; indentation
(use-package aggressive-indent
  :ensure t
  :defer t
  :pin melpa)

;; srgb colors
(setq ns-use-srgb-colorspace t)

;; font
(defun sm-font () (interactive) (set-frame-font "Source Code Pro-12"))
(defun md-font () (interactive) (set-frame-font "Source Code Pro-14"))
(defun lg-font () (interactive) (set-frame-font "Source Code Pro-16"))
(md-font)

(use-package tangotango-theme
  :ensure t
  :pin melpa
  :config
  (load-theme 'tangotango t)
  (set-face-attribute 'show-paren-match-face nil
                      :background "SteelBlue1")
  (set-cursor-color "DarkOrange")
  (blink-cursor-mode 1))

(use-package powerline
  :config
  (powerline-default-theme)
  (setq visible-bell nil)
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
