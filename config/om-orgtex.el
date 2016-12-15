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
  (add-hook 'org-mode-hook 'turn-on-stripe-table-mode))

(use-package tex
  :ensure auctex
  :pin gnu
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  (setq TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-buffer))

(provide 'om-orgtex)
