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
           "** TODO [#A] %?")))

  (defun org-levels-hook ()
    "Set org-level headers size"
    (dolist
        (face '(org-level-1 org-level-2 org-level-3 org-level-4 org-level-5))
      (set-face-attribute face nil :height 1.0)))
  (add-hook 'org-mode-hook 'org-levels-hook)
  (setq org-ellipsis "  ⤵")
  (setq org-bullets-bullet-list '("✱" "☉" "○" "◦" "∙")) ;; "⊚"
  (set-face-attribute 'org-date nil
                      :underline t :foreground "#cbaec8")
  (set-face-foreground 'org-special-keyword "tomato"))

(use-package org-bullets
  :ensure t
  :pin melpa-stable
  :defer t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

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
