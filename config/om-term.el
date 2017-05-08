;; om-term.el
;;
;; keywords: sql, postgres, psql
;;           eshell

;; Postgres specific: create ~/.pgpass file in format:
;; host:port:db:user:password

;; sql client
(use-package sql
  :bind ("C-c q" . sql-connect)
  :config
  (defun read-lines (file-name)
    (if (file-exists-p "~/.pgpass")
        (with-temp-buffer
          (insert-file-contents file-name)
          (split-string (buffer-string) "\n" t))
      nil))

  (defun psql:connection-alist (pgpass)
    (let ((value))
      (dolist (element pgpass value)
        (setq srv-element (split-string element ":"))
        (setq value (cons (list (intern (nth 0 srv-element))
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

  (add-hook 'sql-interactive-mode-hook
            (lambda ()
              (toggle-truncate-lines t))))

;; eshell prompt
(use-package eshell
  :defer t
  :bind ("C-c e" . eshell)
  :config

  (defmacro with-face (str &rest properties)
    `(propertize ,str 'face (list ,@properties)))

  (setq eshell-prompt-function
        (lambda ()
          (concat "\n"
                  (with-face (concat "[" (eshell/pwd) "]")
                             :foreground "#aaffaa")
                  (with-face "\n> ")))
        eshell-prompt-regexp (concat "^" (regexp-quote "> "))))

;; zsh term
(use-package multi-term
  :ensure t
  :pin melpa
  :bind ("C-c m" . multi-term)
  :config
  (setq multi-term-program "/bin/zsh")
  (set-face-foreground 'term-color-blue "SkyBlue1")
  (set-face-foreground 'term-color-red "tomato")
  (add-hook 'term-mode-hook
            (lambda ()
              (setq term-buffer-maximum-size 10000)
              (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
              (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next)))))

(provide 'om-term)
