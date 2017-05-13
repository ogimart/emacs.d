;; om-python.el
;;
;; keywords: python-mode, company-jedi, virtualenvwrapper

(use-package python
  :bind (:map python-mode-map
              ("C-c i" . ipython-interpreter)
              ("C-c d" . django-runserver)
              ("C-c s" . django-shell-plus)
              ("C-c C-t" . ipdb:insert-trace))
  :config
  (setq python-shell-interpreter "ipython")

  (defun ipython-interpreter ()
    (interactive)
    (setq python-shell-interpreter "ipython")
    (message "interpreter: ipython"))

  (defun django-shell-plus ()
    (interactive)
    (setq python-shell-interpreter "python"
          python-shell-interpreter-args
          (concat (projectile-project-root)
                  "manage.py shell_plus"))
    (message "interpreter: python manage.py shell_plus"))

  (defun django-runserver ()
    (interactive)
    (setq python-shell-interpreter "python"
          python-shell-interpreter-args
          (concat (projectile-project-root)
                  "manage.py runserver"))
    (message "interpreter: python manage.py runserver"))

  ;; break point insert
  (defun ipdb:insert-trace (arg)
    (interactive "p")
    (open-previous-line arg)
    (insert "import ipdb; ipdb.set_trace()")
    (highlight-lines-matching-regexp "^[ ]*import ipdb; ipdb.set_trace()"))

  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'python-mode-hook 'aggressive-indent-mode))

(use-package company-jedi
  :ensure t
  :pin melpa
  :bind (:map python-mode-map
              ("C-c ." . jedi:goto-definition)
              ("C-c ," . jedi:goto-definition-pop-marker)
              ;; ("C-c r" . helm-jedi-related-names)
              ("C-c k" . jedi:show-doc)
              ("C-c /" . jedi:get-in-function-call))
  :config
  (after 'python
    (add-hook 'python-mode-hook
              (lambda ()
                (add-to-list 'company-backends 'company-jedi)))
    (setq jedi:complete-on-dot t)))

(use-package virtualenvwrapper
  :ensure t
  :pin melpa
  :bind (:map python-mode-map
              ("C-c v" . venv-workon))
  :config
  (after 'python
    (venv-initialize-interactive-shells)
    (venv-initialize-eshell)
    (setq venv-location "~/.virtualenvs")
    (setq-default mode-line-format
                  (cons '(:exec venv-current-name) mode-line-format))))

(provide 'om-python)
