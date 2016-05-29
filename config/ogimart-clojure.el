;; ogimart-clojure.el
;;
;; uses: clojure-mode, cider

(use-package clojure-mode
  :ensure t
  :pin melpa-stable
  :config
  (progn
    (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
    (add-hook 'clojure-mode-hook 'highlight-numbers-mode)
    (add-hook 'clojure-mode-hook 'highlight-quoted-mode)))

(use-package cider
  :ensure t
  :pin melpa-stable
  :bind ("C-c j" . cider-jack-in)
  :config
  (progn
    (setq cider-repl-use-clojure-font-lock t)
    (add-hook 'cider-repl-mode-hook #'company-mode)
    (add-hook 'cider-mode-hook #'company-mode)))

(provide 'ogimart-clojure)
