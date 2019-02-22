;; om-python.el
;;
;; keywords: python-mode, anaconda-mode, pyenv

(use-package python
  :bind (:map python-mode-map
              ("C-c i" . i-python-interpreter)
              ("C-c d" . python-interpreter)
              ("C-c C-t" . ipdb:insert-trace))
  :config
  (setq python-shell-interpreter "python3")

  (defun i-python-interpreter ()
    (interactive)
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "--simple-prompt -i")
    (message "interpreter: ipython"))

  (defun python-interpreter ()
    (interactive)
    (setq python-shell-interpreter "python3"
          python-shell-interpreter-args "")
          ;; (concat (projectile-project-root) ""))
    (message "interpreter: python3"))

  ;; ;; break point insert
  (defun ipdb:insert-trace (arg)
    (interactive "p")
    (open-previous-line arg)
    (insert "import ipdb; ipdb.set_trace()")
    (highlight-lines-matching-regexp "^[ ]*import ipdb; ipdb.set_trace()"))

  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'turn-on-eldoc-mode))

(use-package anaconda-mode
  :ensure t
  :pin melpa
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
  :ensure t
  :pin melpa
  :config
  (add-to-list 'company-backends 'company-anaconda)
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package pyenv-mode
  :ensure t
  :config
    (defun projectile-pyenv-mode-set ()
      "Set pyenv version matching project name."
      (let ((project (projectile-project-name)))
        (if (member project (pyenv-mode-versions))
            (pyenv-mode-set project)
          (pyenv-mode-unset))))

    (add-hook 'projectile-switch-project-hook 'projectile-pyenv-mode-set)
    (add-hook 'python-mode-hook 'pyenv-mode))

(provide 'om-python)
