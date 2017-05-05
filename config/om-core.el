;; om-core.el
;;
;; keywords: ido, flx-ido, fuzzy, indent
;;           mode line, font, highlight

;; fuzzy search
(use-package flx
  :ensure t
  :defer t
  :pin melpa)

;; ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done))

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
(defun sm-font ()
  (interactive)
  (set-frame-font
   "-*-Source Code Pro-light-normal-normal-*-12-*-*-*-m-0-iso10646-1"))
(defun md-font ()
  (interactive)
  (set-frame-font
   "-*-Source Code Pro-light-normal-normal-*-13-*-*-*-m-0-iso10646-1"))
(defun lg-font ()
  (interactive)
  (set-frame-font
   "-*-Source Code Pro-light-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
(md-font)

(use-package noctilux-theme
  :ensure noctilux-theme
  :pin melpa
  :config
  (progn
    (load-theme 'noctilux t)
    (set-face-attribute 'vertical-border
                        nil
                        :foreground "#5F5F5F")
    (set-face-attribute 'show-paren-match-face nil
                        :background "#5F5F5F")
    (blink-cursor-mode 0)
    (set-cursor-color "white")
    (set-mouse-color "white")))

;; mode line
(use-package smart-mode-line
  :ensure t
  :pin melpa
  :config
  (progn
    (setq sml/no-confirm-load-theme t)
    (setq sml/theme 'dark)
    (sml/setup)
    (setq visible-bell nil)
    (setq ring-bell-function
          (lambda ()
            (invert-face 'mode-line)
            (run-with-timer 0.1 nil 'invert-face 'mode-line)))))

;; highlight numbers and quotes
(use-package highlight-numbers
  :ensure t
  :pin melpa)

(use-package highlight-quoted
  :ensure t
  :pin melpa)

(provide 'om-core)
