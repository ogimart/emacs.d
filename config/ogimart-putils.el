;; ogimart-putils.el
;;
;; uses: company, flycheck, highlight-numbers, highlight-quoted,
;;       yaml-mode, restclient, whitespace

(use-package company
  :ensure t
  :pin melpa-stable
  :init (global-company-mode))

(use-package flycheck
  :ensure t
  :pin melpa-stable)

(use-package highlight-numbers
  :ensure t
  :pin melpa)

(use-package highlight-quoted
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
  (setq-default whitespace-line-column 80
                whitespace-style '(face lines-tail trailing))
  :diminish whitespace-mode)

(add-to-list 'auto-mode-alist '("\\.zsh$'" . sh-mode))
(add-hook 'sh-mode-hook
          (lambda ()
            (if (string-match "\\.zsh$" buffer-file-name)
                (sh-set-shell "zsh"))))

(add-hook 'emacs-lisp-mode-hook 'highlight-numbers-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)

(provide 'ogimart-putils)
