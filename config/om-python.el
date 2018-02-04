;; om-python.el
;;
;; keywords: python-mode, company-jedi, conda

(use-package python
  :bind (:map python-mode-map
              ("C-c i" . ipython-interpreter)
              ("C-c d" . django-runserver)
              ("C-c s" . django-shell-plus)
              ("C-c C-t" . ipdb:insert-trace))
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i")

  (defun ipython-interpreter ()
    (interactive)
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i")
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
  (add-hook 'python-mode-hook 'turn-on-eldoc-mode))

(use-package company-jedi
  :ensure t
  :pin melpa
  :bind (("C-c ." . jedi:goto-definition)
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

(use-package conda
  :ensure t
  :pin melpa
  :bind ("C-c v" . conda-env-activate)
  :config
  (after 'python
    (conda-env-initialize-interactive-shells)
    (conda-env-initialize-eshell)
    (custom-set-variables
     '(conda-anaconda-home "~/miniconda3"))
    (setq-default mode-line-format
                  (cons '(:exec conda-env-current-name) mode-line-format))))

(provide 'om-python)
