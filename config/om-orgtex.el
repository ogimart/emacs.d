;; om-orgmode.el
;;
;; keywords: org-mode, tex, auctex

(use-package org
  :bind (("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :config
  ;; tasks
  (setq org-log-done t)
  (setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
  (setq org-agenda-window-setup 'current-window)

  ;; agenda
  (setq org-agenda-show-all-dates nil)
  (setq org-directory "~/Dropbox/org")
  (setq org-default-notes-file "notes.org")
  (setq org-agenda-files `(,(concat org-directory "/cognical.org")
                           ,(concat org-directory "/home.org")
                           ,(concat org-directory "/inforisk.org")
                           ,(concat org-directory "/music.org")))
  (setq org-refile-targets '((nil :maxlevel . 1)
                             (org-agenda-files :maxlevel . 1)))
  (setq org-capture-templates
        '(("t" "todo"
           entry (file+headline org-default-notes-file "Capture")
           "** TODO [#A] %?\n")
          ("w" "task"
           entry (file+headline "cognical.org" "Tasks")
           "** TODO [#A] %? :work:\n")
          ("m" "meeting"
           entry (file+headline "cognical.org" "Schedule")
           "** Meeting with %? :meeting:\n   SCHEDULED: %t" :scheduled t)
          ("a" "appointment"
           entry (file+headline "home.org" "Appointments")
           "** %? Appointment :appointment:\nSCHEDULED: %t" :scheduled t)))

  ;; mobile
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
  (setq org-mobile-inbox-for-pull (concat org-directory "/from-mobile.org"))
  (setq org-mobile-force-id-on-agenda-items nil)

  ;; theme
  (defun org-levels-hook ()
    "Set org-level headers size"
    (dolist
        (face '(org-level-1 org-level-2 org-level-3 org-level-4 org-level-5))
      (set-face-attribute face nil :height 1.0)))
  (add-hook 'org-mode-hook 'org-levels-hook)
  (setq org-src-fontify-natively t)
  (setq org-ellipsis "  …")) ;;"  ⤵" "  ►"

(use-package org-bullets
  :ensure t
  :pin melpa-stable
  :defer t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-bullets-bullet-list '("⊚" "☉" "○" "◦" "∙"))) ;;  "✱" "⊚"

(use-package markdown-mode
  :ensure t
  :pin melpa-stable
  :defer t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package tex
  :ensure auctex
  :defer t
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  (setq TeX-PDF-mode t)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-buffer))

(provide 'om-orgtex)
