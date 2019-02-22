;; om-evil.el
;;
;; keywords: evil, vim

(use-package evil
  :ensure t
  :pin melpa-stable
  :init (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :pin melpa
  :config
  (evil-collection-init))

;; (use-package evil-leader
;;   :ensure t
;;   :config
;;   (after 'evil
;;     (global-evil-leader-mode)
;;     (evil-leader/set-leader "<SPC>")
;;     (evil-leader/set-key
;;     ; emacs
;;       "b" 'switch-to-buffer
;;       "f" 'find-file
;;       "w" 'save-buffer
;;       ";" 'comment-line
;;       "m" 'multi-term
;;       "g" 'magit-status
;;       "e" 'eshell
;;       "q" 'sql-connect
;;       "k" 'kill-this-buffer
;;     ; projectile
;;       "pp" 'projectile-switch-project
;;       "pf" 'projectile-find-file
;;       "pa" 'projectile-ag)
;;     ; common lisp
;;     (evil-leader/set-key-for-mode 'lisp-mode
;;       "el" 'sly-eval-last-expression
;;       "ep" 'sly-pprint-eval-last-expression
;;       "ed" 'sly-eval-defun
;;       "er" 'sly-eval-region
;;       "ev" 'sly-re-evaluate-defvar
;;       "m1" 'sly-macroexpand-1
;;       "ma" 'sly-macroexpand-all)))

;; default emacs state

(add-to-list 'evil-emacs-state-modes 'ag-mode)
(add-to-list 'evil-emacs-state-modes 'dired)
(add-to-list 'evil-emacs-state-modes 'flycheck-error-list-mode)
(add-to-list 'evil-emacs-state-modes 'git-rebase-mode)

;; vim binding of occur mode

;; (evil-add-hjkl-bindings occur-mode-map 'emacs
;;   (kbd "/")       'evil-search-forward
;;   (kbd "n")       'evil-search-next
;;   (kbd "N")       'evil-search-previous
;;   (kbd "C-d")     'evil-scroll-down
;;   (kbd "C-u")     'evil-scroll-up
;;   (kbd "C-w C-w") 'other-window)

;; osx clipboard

(defun evil-osx-clipboard/copy (start end)
  "copy to the system clipboard"
  (interactive "r")
  (shell-command-on-region start end "pbcopy"))

(defun evil-osx-clipboard/paste ()
  "paste from the system clipboard"
  (interactive)
  (insert (shell-command-to-string "pbpaste")))

(defun evil-osx-clipboard/set-osx-defaults ()
  "set control-shift-c/v as copy and paste from system clipboard"
  (interactive)
  (define-key evil-normal-state-map (kbd "s-c") 'evil-osx-clipboard/copy)
  (define-key evil-visual-state-map (kbd "s-c") 'evil-osx-clipboard/copy)
  (define-key evil-insert-state-map (kbd "s-v") 'evil-osx-clipboard/paste)
  (global-set-key (kbd "s-c") 'evil-osx-clipboard/copy)
  (global-set-key (kbd "s-v") 'evil-osx-clipboard/paste))

(evil-osx-clipboard/set-osx-defaults)

(provide 'om-evil)
