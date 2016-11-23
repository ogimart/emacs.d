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
(require 'ogimart-look)        ;; solarized-theme, smart-mode-line, font
(require 'ogimart-interactive) ;; interactive commands
(require 'ogimart-helm)        ;; helm, helm-projectile, helm-ag, helm-mt
(require 'ogimart-project)     ;; projectile, project-explorer, magit
(require 'ogimart-putils)      ;; company, flycheck, realgud, multi-term ...
(require 'ogimart-lisp)        ;; slime, slime-company
(require 'ogimart-clojure)     ;; clojure-mode, cider
(require 'ogimart-python)      ;; company-jedi, virtualenvwrapper
(require 'ogimart-psql)        ;; sql
(require 'ogimart-eshell)      ;; eshell
(require 'ogimart-java)        ;; eclim, company-emacs-eclim

;; emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

