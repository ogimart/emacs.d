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
  ;; (add-hook 'clojure-mode-hook 'paren-face-mode)
  )

(use-package cider
  :ensure t
  :pin melpa
  :defer t
  :config
  (setq cider-repl-use-clojure-font-lock t)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode))

(use-package clj-refactor
  :ensure t
  :pin melpa
  :defer t
  :config
  (add-hook 'clojure-mode-hook
            (lambda ()
              (clj-refactor-mode 1)
              (yas-minor-mode 1))))

(use-package slime
  :ensure t
  :pin melpa
  :defer t
  :config
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package gambit
  :load-path "/usr/local/opt/gambit-scheme/current/share/emacs/site-lisp/"
  :after evil
  :config
  (autoload 'gambit-inferior-mode "gambit" "Hook Gambit mode into cmuscheme.")
  (autoload 'gambit-mode "gambit" "Hook Gambit mode into scheme.")
  (add-hook 'inferior-scheme-mode-hook (function gambit-inferior-mode))
  (add-hook 'scheme-mode-hook (function gambit-mode))
  (setq scheme-program-name "gsi -:d-")

  (defun evil-gambit-last-sexp (command &rest args)
    (if (and (not evil-move-beyond-eol)
             (or (evil-normal-state-p) (evil-motion-state-p)))
        (save-excursion
          (unless (or (eobp) (eolp)) (forward-char))
          (apply command args))
      (apply command args)))

  (unless evil-move-beyond-eol
    (advice-add 'scheme-send-last-sexp :around 'evil-gambit-last-sexp)))

(use-package gerbil
  :defer t
  :load-path "/usr/local/opt/gerbil-scheme/etc/"
  :init
  )

(use-package lisp-mode
  :defer t
  :init
  (add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-mode-hook 'highlight-numbers-mode)
  (add-hook 'lisp-mode-hook 'highlight-quoted-mode)
  ;; (add-hook 'lisp-mode-hook 'paren-face-mode)
            )

(use-package emacs-lisp
  :defer t
  :init
  (add-hook 'emacs-lisp-mode-hook 'highlight-numbers-mode)
  (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)
  ;; (add-hook 'emacs-lisp-mode-hook 'paren-face-mode)
  )

(use-package prolog-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode)))

(provide 'om-lisp)
