;; ogimart-core.el
;;
;; uses: ido, icomplete

;; after macro
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;; turn off: tool bar, scroll bar, menu bar and splash screen
(tool-bar-mode 0)
(scroll-bar-mode 0)
;(menu-bar-mode 0)
(setq inhibit-splash-screen t)

;; default frame size
(setq default-frame-alist '(
  (width . 120)
  (height . 48)))

;; mac modifier keys - make Command as Meta, Option as Alt
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'meta))

;; take the short answer y/n is yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; tabs (spaces only)
(setq-default indent-tabs-mode nil)

;; line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; use ibuffer for list buffers
(defalias 'list-buffers 'ibuffer)

;; show matching parentheses
(show-paren-mode 1)
(defvar show-paren-delay 0)

;; interactively do things
(use-package ido
  :config (ido-mode t))
(use-package icomplete)

;; follow symbolic links
(setq vc-follow-symlinks t)

;; backup
(defvar --backup-dir (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-dir))
        (make-directory --backup-dir t))
(setq backup-directory-alist `(("." . ,--backup-dir)))
(setq make-backup-files t          ; backup of a file the first time it is saved
      backup-by-copying t          ; copy
      version-control t            ; version numbers for backup files
      delete-old-versions t        ; delete excess backup files silently
      delete-by-moving-to-trash t  ; move to trash
      auto-save-default t          ; auto-save every buffer that visits a file
      )

(provide 'ogimart-core)
