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
  (add-hook 'clojure-mode-hook 'paren-face-mode)
  (add-hook 'clojure-mode-hook 'aggressive-indent-mode))

(use-package cider
  :ensure t
  :pin melpa-stable
  :bind ("C-c j" . cider-jack-in)
  :config
  (setq cider-repl-use-clojure-font-lock t)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (set-face-foreground 'cider-fringe-good-face "#78909C")
  (set-face-attribute 'cider-result-overlay-face nil
                      :background "#37474F"
                      :box '(:line-width -1 :color "#555555")))

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
  :defer t)

(use-package lisp-mode
  :defer t
  :init
  (add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-mode-hook 'highlight-numbers-mode)
  (add-hook 'lisp-mode-hook 'highlight-quoted-mode)
  (add-hook 'lisp-mode-hook 'paren-face-mode)
  (add-hook 'lisp-mode-hook 'aggressive-indent-mode))

(use-package emacs-lisp
  :init
  (add-hook 'emacs-lisp-mode-hook 'highlight-numbers-mode)
  (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)
  (add-hook 'emacs-lisp-mode-hook 'paren-face-mode)
  (add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode))

(use-package prolog-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode)))

(provide 'om-lisp)
