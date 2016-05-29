;; ogimart-look.el
;;
;; uses: noctilux-theme, smart-mode-line 

;; srgb colors
(setq ns-use-srgb-colorspace t)

;; set adobe source code pro font, use only light wight
(set-default-font
 "-*-Source Code Pro-light-normal-normal-*-12-*-*-*-m-0-iso10646-1")
(mapc (lambda (face)
        (set-face-attribute face nil :weight 'light))
      (face-list))

;; noctilux color theme
(use-package noctilux-theme
  :ensure noctilux-theme
  :pin melpa-stable
  :config
  (progn
    (load-theme 'noctilux t)))

;; cursor & paren match
(blink-cursor-mode 0)
(set-face-attribute 'show-paren-match-face nil
                    :foreground "white smoke"
                    :background "dim gray")

;; selected region
(set-face-attribute 'region nil :background "white" :foreground "royal blue")

;; mode line
(use-package smart-mode-line
  :ensure t
  :pin melpa
  :config
  (progn
    (setq sml/no-confirm-load-theme t)
    (setq sml/theme 'respectful)
    (sml/setup)))

;; vertical border
(set-face-attribute 'vertical-border
                    nil
                    :foreground "grey13")

(provide 'ogimart-look)
