;; om-clojure.el
;;
;; uses: clojure-mode, cider

(use-package clojure-mode
  :ensure t
  :pin melpa-stable
  :config
  (progn
    (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
    (add-hook 'clojure-mode-hook 'highlight-numbers-mode)
    (add-hook 'clojure-mode-hook 'highlight-quoted-mode)
    (add-hook 'clojure-mode-hook 'paren-face-mode)
    (add-hook 'clojure-mode-hook 'aggressive-indent-mode)))

(use-package cider
  :ensure t
  :pin melpa-stable
  :bind ("C-c j" . cider-jack-in)
  :config
  (progn
    (setq cider-repl-use-clojure-font-lock t)
    (add-hook 'cider-repl-mode-hook #'company-mode)
    (add-hook 'cider-mode-hook #'company-mode)))

(use-package clj-refactor
  :ensure t
  :pin melpa-stable
  :config
  (progn
    ;; (setq cljr-suppress-middleware-warnings t)
    (add-hook 'clojure-mode-hook
              (lambda ()
                (clj-refactor-mode 1)
                (yas-minor-mode 1)
                (local-set-key (kbd "C-c C-r") 'cljr-helm)))))

(provide 'om-clojure)
