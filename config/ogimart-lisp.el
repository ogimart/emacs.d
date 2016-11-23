;; ogimat-common-lisp.el
;;
;; uses: slime-company

(add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/slime-2.14")

(use-package slime
  :config
  (progn
    ;; (setq inferior-lisp-program "/usr/local/bin/sbcl")
    (setq slime-lisp-implementations
          `((sbcl ("/usr/local/bin/sbcl"))
            (ccl ("/usr/local/bin/ccl64"))
            (cmucl ("/usr/local/bin/lisp"))))
    (load "~/quicklisp/slime-helper.el")
    (setq slime-contribs '(slime-fancy))))

(use-package slime-company
  :ensure t
  :pin melpa-stable
  :config
  (progn
    (after 'slime
      (slime-setup '(slime-company)))))

(use-package lisp-mode
  :config
  (progn
    (add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
    (add-hook 'lisp-mode-hook 'highlight-numbers-mode)
    (add-hook 'lisp-mode-hook 'highlight-quoted-mode)
    (add-hook 'lisp-mode-hook 'paren-face-mode)))

(use-package emacs-lisp
  :init
  (add-hook 'emacs-lisp-mode-hook 'highlight-numbers-mode)
  (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode)
  (add-hook 'emacs-lisp-mode-hook 'paren-face-mode))

(provide 'ogimart-lisp)
