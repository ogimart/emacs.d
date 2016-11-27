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
(require 'om-core)        ;; core settings
(require 'om-look)        ;; solarized-theme, smart-mode-line, font
(require 'om-interactive) ;; interactive commands
(require 'om-helm)        ;; helm, helm-projectile, helm-ag, helm-mt
(require 'om-project)     ;; projectile, project-explorer, magit
(require 'om-putils)      ;; company, flycheck, realgud, multi-term ...
(require 'om-lisp)        ;; slime, slime-company
(require 'om-clojure)     ;; clojure-mode, cider
(require 'om-python)      ;; company-jedi, virtualenvwrapper
(require 'om-psql)        ;; sql
(require 'om-eshell)      ;; eshell
(require 'om-java)        ;; eclim, company-emacs-eclim

;; custom set
(setq custom-file "~/.emacs.d/custom.el")

;; emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
