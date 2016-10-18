;; ogimart-python.el
;;
;; uses: python-mode, company-jedi, virtualenvwrapper

(use-package python
  :config
  (progn
    ;; interpeter toggle: ipython / django shell_plus
    (setq python-shell-interpreter "ipython")
    (defvar shell-plus nil)
    (defun shell-plus-toggle ()
      (interactive)
      (cond ((eq shell-plus nil)
             (setq python-shell-interpreter "python"
                   python-shell-interpreter-args
                   (concat (projectile-project-root)
                           "manage.py shell_plus")
                   shell-plus t)
             (message "interpreter: python manage.py shell_plus"))
            ((eq shell-plus t)
             (setq python-shell-interpreter "ipython"
                   python-shell-interpreter-args ""
                   shell-plus nil)
             (message "interpreter: ipython"))))

    ;; break point insert
    (defun ipdb:insert-trace (arg)
      (interactive "p")
      (open-previous-line arg)
      (insert "import ipdb; ipdb.set_trace()")
      (highlight-lines-matching-regexp "^[ ]*import ipdb; ipdb.set_trace()"))

    (add-hook 'python-mode-hook 'flycheck-mode)
    (add-hook 'python-mode-hook 'turn-on-eldoc-mode)
    (add-hook 'python-mode-hook
              '(lambda ()
                 (local-set-key (kbd "C-c C-g") 'shell-plus-toggle)
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

      (defvar jedi:goto-stack '())
      (defun jedi:jump-to-definition ()
        (interactive)
        (add-to-list 'jedi:goto-stack
                     (list (buffer-name) (point)))
        (jedi:goto-definition))
      (defun jedi:jump-back ()
        (interactive)
        (let ((p (pop jedi:goto-stack)))
          (if p (progn
                  (switch-to-buffer (nth 0 p))
                  (goto-char (nth 1 p))))))
      (add-hook 'python-mode-hook
                '(lambda ()
                   (local-set-key (kbd "C-c .") 'jedi:jump-to-definition)
                   (local-set-key (kbd "C-c ,") 'jedi:jump-back)
                   (local-set-key (kbd "C-c k") 'jedi:show-doc))))))

(use-package virtualenvwrapper
  :ensure t
  :pin melpa
  :config
  (progn
    (after 'python
      (venv-initialize-interactive-shells)
      (venv-initialize-eshell)
      (setq venv-location "~/.virtualenvs")
      (setq-default mode-line-format
                    (cons '(:exec venv-current-name) mode-line-format)))))

(provide 'ogimart-python)
