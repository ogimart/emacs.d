;; init.el

;; path
(add-to-list 'load-path (concat user-emacs-directory "config"))

;;; package sites
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

; my packages
(require 'ogimart-core)        ;; core settings
(require 'ogimart-look)        ;; noctilux-theme, smart-mode-line, font
(require 'ogimart-interactive) ;; interactive commands
(require 'ogimart-helm)        ;; helm, helm-projectile, helm-ag
(require 'ogimart-project)     ;; projectile, project-explorer, magit
(require 'ogimart-putils)      ;; company, flycheck, ...
(require 'ogimart-common-lisp) ;; slime, slime-company
(require 'ogimart-clojure)     ;; clojure-mode, cider
(require 'ogimart-python)      ;; company-jedi, virtualenvwrapper
(require 'ogimart-sql)         ;; sql
(require 'ogimart-eshell)      ;; eshell

;; emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
