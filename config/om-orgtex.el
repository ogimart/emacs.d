;; om-orgmode.el
;;
;; keywords: org-mode, tex, auctex

(use-package org
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :config
  (setq org-agenda-files '("~/org/"))
  (setq org-log-done t)
  (setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
  (setq org-capture-templates
        '(("t" "todo" entry (file+headline "~/org/todo.org" "Tasks")
           "* TODO [#A] %?"))))

(use-package tex
  :ensure auctex
  :defer t
  :pin gnu
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  (setq TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-buffer))

(provide 'om-orgtex)
