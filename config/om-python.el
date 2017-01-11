;; om-python.el
;;
;; uses: python-mode, company-jedi, virtualenvwrapper

(use-package python
  :config
  (progn
    (setq python-shell-interpreter "ipython")

    (defun ipython-interpeter ()
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
    (add-hook 'python-mode-hook 'aggressive-indent-mode)
    (add-hook 'python-mode-hook
              '(lambda ()
                 (local-set-key (kbd "C-c i")   'ipython-interpeter)
                 (local-set-key (kbd "C-c s")   'django-shell-plus)
                 (local-set-key (kbd "C-c d")   'django-runserver)
                 (local-set-key (kbd "C-c C-t") 'ipdb:insert-trace)))))

(use-package company-jedi
  :ensure t
  :pin melpa
  :config
  (progn
    (after 'python
      (add-hook 'python-mode-hook
                (lambda ()
                  (add-to-list 'company-backends 'company-jedi)))
      (setq jedi:complete-on-dot t)

      (add-hook 'python-mode-hook
                '(lambda ()
                   (local-set-key (kbd "C-c .") 'jedi:goto-definition)
                   (local-set-key (kbd "C-c ,") 'jedi:goto-definition-pop-marker)
                   (local-set-key (kbd "C-c r") 'helm-jedi-related-names)
                   (local-set-key (kbd "C-c k") 'jedi:show-doc)
                   (local-set-key (kbd "C-c /") 'jedi:get-in-function-call))))))

(use-package virtualenvwrapper
  :ensure t
  :pin melpa
  :bind ("C-c v" . venv-workon)
  :config
  (progn
    (after 'python
      (venv-initialize-interactive-shells)
      (venv-initialize-eshell)
      (setq venv-location "~/.virtualenvs")
      (setq-default mode-line-format
                    (cons '(:exec venv-current-name) mode-line-format)))))

(provide 'om-python)
