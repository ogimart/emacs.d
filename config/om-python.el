;; om-python.el
;;
;; keywords: python-mode, company-jedi, conda

(use-package python
  :bind (:map python-mode-map
              ("C-c i" . i-python-interpreter)
              ("C-c d" . python-interpreter)
              ("C-c C-t" . ipdb:insert-trace))
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i")

  (defun i-python-interpreter ()
    (interactive)
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i")
    (message "interpreter: ipython"))

  (defun python-interpreter ()
    (interactive)
    (setq python-shell-interpreter "python")
          ;; python-shell-interpreter-args
          ;; (concat (projectile-project-root) ""))
    (message "interpreter: python"))

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
  :bind ("C-c v" . venv-workon)
  :config
  (after 'python
    (venv-initialize-interactive-shells)
    (venv-initialize-eshell)
    (setq venv-location "~/.virtualenvs")
    (setq-default mode-line-format
                  (cons '(:exec venv-current-name) mode-line-format)))
  (after 'projectile
    (setq projectile-switch-project-action 'venv-projectile-auto-workon)))

(provide 'om-python)
