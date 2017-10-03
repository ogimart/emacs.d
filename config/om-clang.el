;; om-clang.el
;;
;; keywords: c, c++, irony, company-irony, irony-eldoc

(use-package irony
  :ensure t
  :pin melpa-stable
  :defer t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)

  (add-hook 'c++-mode-hook 'flycheck-mode)
  (add-hook 'c-mode-hook 'flycheck-mode)

  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))

  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++14"))))

(use-package company-irony
  :ensure t
  :pin melpa-stable
  :config
  (after 'company
    (setq company-backends (delete 'company-semantic company-backends))
    (add-to-list 'company-backends 'company-irony)))

(use-package irony-eldoc
  :ensure t
  :pin melpa
  :config
  (add-hook 'irony-mode-hook #'irony-eldoc))

(use-package cmake-ide
  :ensure t
  :pin melpa-stable
  :config
  (cmake-ide-setup)
  (setq cmake-ide-flags-c++ (append '("-std=c++14")))
  (global-set-key (kbd "C-c C-m") 'cmake-ide-compile))

(provide 'om-clang)
