;; ogimart-putils.el
;;
;; uses: company, flycheck, realgud, highlight-numbers, highlight-quoted,
;;       paren-face, yaml-mode, restclient, whitespace, multi-term

(use-package company
  :ensure t
  :pin melpa-stable
  :init (global-company-mode))

(use-package flycheck
  :ensure t
  :pin melpa-stable)

(use-package realgud
  :ensure t
  :pin melpa)

(use-package highlight-numbers
  :ensure t
  :pin melpa)

(use-package highlight-quoted
  :ensure t
  :pin melpa)

(use-package paren-face
  :ensure t
  :pin melpa)

(use-package yaml-mode
  :ensure t
  :pin melpa
  :config (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package restclient
  :ensure t
  :pin melpa
  :config (add-to-list 'auto-mode-alist '("\.rest$" . restclient-mode)))

(use-package whitespace
  :init
  (add-hook 'prog-mode-hook 'whitespace-mode)
  :config
  (setq-default whitespace-line-column 100
                whitespace-style '(face lines-tail trailing))
  :diminish whitespace-mode)

(use-package multi-term
  :ensure t
  :pin melpa
  :config
  (setq multi-term-program "/bin/zsh")
  (add-hook 'term-mode-hook
            (lambda ()
              (setq term-buffer-maximum-size 10000)
              (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
              (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next)))))

(add-to-list 'auto-mode-alist '("\\.zsh$'" . sh-mode))
(add-hook 'sh-mode-hook
          (lambda ()
            (if (string-match "\\.zsh$" buffer-file-name)
                (sh-set-shell "zsh"))))

(add-hook 'emacs-lisp-mode-hook 'highlight-numbers-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)
(add-hook 'emacs-lisp-mode-hook 'paren-face-mode)

(provide 'ogimart-putils)
