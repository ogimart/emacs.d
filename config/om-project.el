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
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-completion-system 'ivy))

(use-package project-explorer
  :ensure project-explorer
  :pin melpa-stable
  :bind ("C-x p" . project-explorer-open)
  :config
  (setq pe/cache-directory "~/.emacs.d/cache/project_explorer")
  (setq pe/omit-regex
        (concat pe/omit-regex "\\|.pyc" "\\|.class" "\\|.fasl")))

(use-package magit
  :ensure magit
  :pin melpa-stable
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-completing-read-function 'ivy-completing-read))

(use-package flycheck
  :ensure t
  :defer t
  :pin melpa-stable)

(use-package company
  :ensure t
  :pin melpa-stable
  :bind ("C-x c" . company-complete)
  :config
  (global-company-mode)
  (setq company-backends (delete 'company-semantic company-backends)))

(use-package dockerfile-mode
  :ensure t
  :pin melpa-stable
  :mode ("Dockerfile\\'" . dockerfile-mode))

(use-package yaml-mode
  :ensure t
  :pin melpa
  :mode ("\\.yml\\'" . yaml-mode))

(use-package restclient
  :ensure t
  :pin melpa
  :mode ("\.rest$" . restclient-mode))

(use-package company-restclient
  :ensure t
  :defer t
  :pin melpa
  :config
  (after 'company
    (add-to-list 'company-backends 'company-restclient)))

(provide 'om-project)
