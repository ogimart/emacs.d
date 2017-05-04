;; om-lisp.el
;;
;; keywords: clojure, cider, refactor
;;           slime, common lisp, elisp

(use-package clojure-mode
  :ensure t
  :pin melpa-stable
  :defer t
  :config
  (progn
    (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
    (add-hook 'clojure-mode-hook 'highlight-numbers-mode)
    (add-hook 'clojure-mode-hook 'highlight-quoted-mode)
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
  :defer t
  :config
  (add-hook 'clojure-mode-hook
            (lambda ()
              (clj-refactor-mode 1)
              (yas-minor-mode 1))))

(use-package slime
  :ensure t
  :pin melpa-stable
  :config
  (progn
    (setq inferior-lisp-program "/usr/local/bin/sbcl")
    ;; (load "~/quicklisp/slime-helper.el")
    (setq slime-contribs '(slime-fancy))))

(use-package slime-company
  :ensure t
  :pin melpa-stable
  :config
  (progn
    (after 'slime
      (slime-setup '(slime-company)))))

(use-package lisp-mode
  :init
  (add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-mode-hook 'highlight-numbers-mode)
  (add-hook 'lisp-mode-hook 'highlight-quoted-mode)
  (add-hook 'lisp-mode-hook 'aggressive-indent-mode))

(use-package emacs-lisp
  :init
  (add-hook 'emacs-lisp-mode-hook 'highlight-numbers-mode)
  (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)
  (add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode))

(provide 'om-lisp)
