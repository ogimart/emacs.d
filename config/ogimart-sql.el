;; ogimart-sql.el
;;
;; uses: sql

;; Postgres specific: create ~/.pgpass file in format:
;; host:port:db:user:password
;;
;; When db credentials added:
;; git update-index --assume-unchanged config/ogimart-sql

(use-package sql
  :config
  (progn
    (setq sql-connection-alist
          '((pg-local-conn (sql-product 'postgres)
                           (sql-port 5432)
                           (sql-server "localhost")
                           (sql-user "--omitted--")
                           (sql-password "--omittied--")
                           (sql-database "--omittied--"))))

    (defun sql:pg-local-server ()
      (interactive)
      (setq sql-product 'postgres)
      (sql-connect 'pg-local-conn))

    (defvar sql:servers-list
      '(("local db" sql:pg-local-server)))

    (defun sql:server-connect (func)
      (interactive (helm-comp-read "Select server: " sql:servers-list))
      (funcall func))
    (global-set-key (kbd "C-c q") 'sql:server-connect)

    (add-hook 'sql-interactive-mode-hook
              (lambda ()
                (toggle-truncate-lines t)))))

(provide 'ogimart-sql)

