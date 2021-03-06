;; init.el

;; gc stops
(setq gc-cons-threshold 100000000)

;; package sites
(setq package-archives
      '(
        ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ; ("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ))

; (setq package-archive-priorities
;       '(("melpa-stable" . 20)
;         ("gnu" . 10)
;         ("org" . 10)
;         ("melpa" . 0)))

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

;; read file
(defun read-lines (file-name)
  (if (file-exists-p file-name)
      (with-temp-buffer
        (insert-file-contents file-name)
        (split-string (buffer-string) "\n" t))
    nil))

;; look settings
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-splash-screen t)
(if (not (display-graphic-p))
    (menu-bar-mode 0))
(setq default-frame-alist '((width . 120) (height . 48)))
(setq line-number-mode t)
(setq column-number-mode t)
(blink-cursor-mode 0)

;; keys, tabs, mac modifier and parens
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))
(setq-default indent-tabs-mode nil)
(setq tab-always-indent 'complete)
(defalias 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1)
(defvar show-paren-delay 0)

;; use ibuffer for list buffers
(defalias 'list-buffers 'ibuffer)

;; follow symbolic links
(setq vc-follow-symlinks t)

;; remote files
(setq tramp-default-method "ssh")

;; config files
(add-to-list 'auto-mode-alist '("\\.*rc$" . conf-unix-mode))

;; regex
(require 'rx)

;; my packages
(add-to-list 'load-path (concat user-emacs-directory "config"))
(require 'om-core)    ;; ivy, indent, white space, global edit
(require 'om-theme)   ;; font, color theme, mode line, highlight
(require 'om-project) ;; projectile, magit, flycheck, company, ...
(require 'om-lisp)    ;; clojure cider, common lisp, sly, ...
(require 'om-python)  ;; jedi, conda
(require 'om-orgtex)  ;; org-mode, auctex for LaTex
(require 'om-term)    ;; psql, eshell, multi-term
(require 'om-clang)   ;; c, c++, irony
(require 'om-evil)    ;; evil

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
