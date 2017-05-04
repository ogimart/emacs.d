;; om-term.el
;;
;; keywords: sql, postgres, psql
;;           eshell

;; Postgres specific: create ~/.pgpass file in format:
;; host:port:db:user:password

;; sql client
(use-package sql
  :bind ("C-c q" . psql:server-connect)
  :config
  (progn
    (defun read-lines (file-name)
      (if (file-exists-p "~/.pgpass")
          (with-temp-buffer
            (insert-file-contents file-name)
            (split-string (buffer-string) "\n" t))
        nil))

    (defun psql:connection-alist (pgpass)
      (let ((value) (i 0))
        (dolist (element pgpass value)
          (setq i (1+ i))
          (setq srv-name (concat "pghost" (number-to-string i)))
          (setq srv-element (split-string element ":"))
          (setq value (cons (list (intern srv-name)
                                  `(sql-server ,(nth 0 srv-element))
                                  `(sql-port ,(string-to-number
                                               (nth 1 srv-element)))
                                  `(sql-database ,(nth 2 srv-element))
                                  `(sql-user ,(nth 3 srv-element))
                                  `(sql-password ,(nth 4 srv-element)))
                            value)))))

    (setq sql-product 'postgres)
    (setq sql-connection-alist
          (reverse (psql:connection-alist (read-lines "~/.pgpass"))))

    (defun psql:server-connect (func)
      (interactive
       (ido-completing-read "select pg server: "
                            (mapcar (lambda (item)
                                      (list
                                       (cadadr item)
                                       `(lambda ()
                                          (sql-connect
                                           (quote ,(car item))))))
                                    sql-connection-alist)))
      (funcall func))

    (add-hook 'sql-interactive-mode-hook
              (lambda ()
                (toggle-truncate-lines t)))))

;; eshell prompt
(use-package eshell
  :defer t
  :config
  (progn

    (defmacro with-face (str &rest properties)
      `(propertize ,str 'face (list ,@properties)))

    (after 'projectile

      (defun eshell/git-branch ()
        (if (executable-find "git")
            (let ((branch (car
                           (split-string
                            (shell-command-to-string
                             "git rev-parse --abbrev-ref HEAD") "\n"))))
              (if (string= (car (split-string branch ":")) "fatal")
                  "" (concat " [" branch "]")))
          ""))

      (setq eshell-prompt-function
            (lambda ()
              (concat "\n"
                      (with-face (concat "[" (eshell/pwd) "]")
                                 :foreground "#268bd2")
                      (with-face (eshell/git-branch)
                                 :foreground "#6c71c4")
                      (with-face "\n> ")))
            eshell-prompt-regexp (concat "^" (regexp-quote "> "))))))

;; zsh term
(use-package multi-term
  :ensure t
  :pin melpa
  :defer t
  :config
  (setq multi-term-program "/bin/zsh")
  (add-hook 'term-mode-hook
            (lambda ()
              (setq term-buffer-maximum-size 10000)
              (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
              (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next)))))

(provide 'om-term)
