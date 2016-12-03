;; om-orgmode.el
;;
;; uses: org-bullets

(use-package org-bullets
  :ensure t
  :pin  melpa
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("⊚" "⊙" "○" "◎" "●" "◦"))
  ;; (setq org-ellipsis " ↴")
  )

(use-package stripe-buffer
  :ensure t
  :pin melpa
  :config
  (add-hook 'org-mode-hook 'turn-on-stripe-table-mode)
  (add-hook 'sql-mode-hook 'turn-on-stripe-table-mode))
