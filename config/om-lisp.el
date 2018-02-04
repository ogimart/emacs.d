;; om-lisp.el
;;
;; keywords: clojure, cider, refactor
;;           sly, common lisp, elisp

(use-package clojure-mode
  :ensure t
  :pin melpa-stable
  :defer t
  :config
  (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'clojure-mode-hook 'highlight-numbers-mode)
  (add-hook 'clojure-mode-hook 'highlight-quoted-mode)
  (add-hook 'clojure-mode-hook 'paren-face-mode))

(use-package cider
  :ensure t
  :pin melpa-stable
  :defer t
  :config
  (setq cider-repl-use-clojure-font-lock t)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode))

(use-package clj-refactor
  :ensure t
  :pin melpa-stable
  :defer t
  :config
  (add-hook 'clojure-mode-hook
            (lambda ()
              (clj-refactor-mode 1)
              (yas-minor-mode 1))))

(use-package sly
  :ensure t
  :pin melpa
  :defer t
  :config
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (use-package sly-company
    :ensure t
    :pin melpa
    :config
    (add-hook 'sly-mode-hook 'sly-company-mode)
    (add-to-list 'company-backends 'sly-company)))

(use-package geiser
  :ensure t
  :pin melpa
  :defer t
  :config
  (setq geiser-active-implementations '(chez))
  (add-hook 'scheme-mode-hook 'paren-face-mode))

(use-package lisp-mode
  :defer t
  :init
  (add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-mode-hook 'highlight-numbers-mode)
  (add-hook 'lisp-mode-hook 'highlight-quoted-mode)
  (add-hook 'lisp-mode-hook 'paren-face-mode))

(use-package emacs-lisp
  :defer t
  :init
  (add-hook 'emacs-lisp-mode-hook 'highlight-numbers-mode)
  (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)
  (add-hook 'emacs-lisp-mode-hook 'paren-face-mode))

(use-package prolog-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode)))

(provide 'om-lisp)
