;; ogimat-common-lisp.el
;;
;; uses: slime, slime-company

(use-package slime
  :ensure t
  :pin melpa-stable
  :config
  (progn
    (setq inferior-lisp-program "/usr/local/bin/sbcl")
    (setq slime-contribs '(slime-fancy))
    (add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
    (add-hook 'lisp-mode-hook 'highlight-numbers-mode)
    (add-hook 'lisp-mode-hook 'highlight-quoted-mode)
    (add-hook 'lisp-mode-hool 'paren-face-mode)))

(use-package slime-company
  :ensure t
  :pin melpa-stable
  :config
  (progn
    (after 'slime
      (slime-setup '(slime-company)))))

(provide 'ogimart-common-lisp)
