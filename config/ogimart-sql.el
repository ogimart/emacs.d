;; ogimart-sql.el
;;
;; uses: sql


;; Postgres specific: create ~/.pgpass file in format:
;; host:port:db:user:password

(use-package sql
  :config
  (progn

    (defun read-lines (file-name)
      (with-temp-buffer
        (insert-file-contents file-name)
        (split-string (buffer-string) "\n" t)))

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
       (helm-comp-read "Select server: "
                       (mapcar (lambda (item)
                                 (list
                                  (cadadr item)
                                  `(lambda ()
                                     (sql-connect
                                      (quote ,(car item))))))
                               sql-connection-alist)))
       (funcall func))

    (global-set-key (kbd "C-c q") 'psql:server-connect)

    (add-hook 'sql-interactive-mode-hook
              (lambda ()
                (toggle-truncate-lines t)))))

(provide 'ogimart-sql)
