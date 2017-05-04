;; om-project.el
;;
;; keywords: projectile, explorer, magit, ag
;;           company, flycheck yaml, docker, rest

(use-package ag
  :ensure ag
  :pin melpa
  :defer t)

(use-package projectile
  :ensure projectile
  :pin melpa-stable
  :config (projectile-global-mode))

(use-package project-explorer
  :ensure project-explorer
  :pin melpa-stable
  :bind ("C-x p" . project-explorer-open)
  :config
  (progn
    (setq pe/cache-directory "~/.emacs.d/cache/project_explorer")
    (setq pe/omit-regex
          (concat pe/omit-regex "\\|.pyc" "\\|.class" "\\|.fasl"))))

(use-package magit
  :ensure magit
  :pin melpa-stable
  :bind ("C-x g" . magit-status))

(use-package flycheck
  :ensure t
  :defer t
  :pin melpa-stable)

(use-package company
  :ensure t
  :pin melpa-stable
  :bind ("C-x c" . company-complete)
  :config (global-company-mode))

(use-package dockerfile-mode
  :ensure t
  :pin melpa-stable
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package yaml-mode
  :ensure t
  :defer t
  :pin melpa
  :config (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package restclient
  :ensure t
  :defer t
  :pin melpa
  :config
  (add-to-list 'auto-mode-alist '("\.rest$" . restclient-mode)))

(use-package company-restclient
  :ensure t
  :defer t
  :pin melpa
  :config
  (after 'company
    (add-to-list 'company-backends 'company-restclient)))

(provide 'om-project)
