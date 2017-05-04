;; init.el

;; package sites
(setq package-archives
      '(("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("melpa" . "http://melpa.org/packages/")))

;; package init
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; after macro
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;; look settings
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-splash-screen t)
(if (not (display-graphic-p))
    (menu-bar-mode 0))
(setq default-frame-alist '((width . 120) (height . 48)))
(setq line-number-mode t)
(setq column-number-mode t)

;; keys, tabs, mac modifier and parens
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'meta))
(setq-default indent-tabs-mode nil)
(setq tab-always-indent 'complete)
(defalias 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1)
(defvar show-paren-delay 0)

;; use ibuffer for list buffers
(defalias 'list-buffers 'ibuffer)

;; follow symbolic links
(setq vc-follow-symlinks t)

;; my packages
(add-to-list 'load-path (concat user-emacs-directory "config"))
(require 'om-core)     ;; ido, theme, mode line, font, indent
(require 'om-keys)     ;; global keys, interactive commands
(require 'om-project)  ;; projectile, magit, flycheck, company, ...
(require 'om-lisp)     ;; clojure cider, common lisp slime
(require 'om-python)   ;; jedi, virtualenvwrapper
(require 'om-orgtex)   ;; org-mode, auctex for LaTex
(require 'om-term)     ;; psql, eshell, multi-term

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

;; custom set, not in git
(setq custom-file "~/.emacs.d/custom.el")

;; emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
