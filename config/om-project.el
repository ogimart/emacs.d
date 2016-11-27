;; om-project.el
;;
;; uses: projectile, project-explorer, magit

(use-package projectile
  :ensure projectile
  :pin melpa-stable
  :config
  (progn
    (projectile-global-mode)
    (setq projectile-completion-system 'helm)))

(use-package project-explorer
  :ensure project-explorer
  :pin melpa-stable
  :bind ("C-c o" . project-explorer-open)
  :config
  (progn
    (setq pe/cache-directory "~/.emacs.d/cache/project_explorer")
    (setq pe/omit-regex
          (concat pe/omit-regex "\\|.pyc" "\\|.class" "\\|.fasl"))))

(use-package magit
  :ensure magit
  :pin melpa-stable
  :bind ("C-c g" . magit-status))

(provide 'om-project)
