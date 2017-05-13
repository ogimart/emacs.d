;; om-core.el
;;
;; keywords: flx, fuzzy, ivy, indent, global edit keys

;; fuzzy search
(use-package flx
  :ensure t
  :defer t)

;; ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)
  (setq ivy-format-function 'ivy-format-function-arrow))

;; imenu
(use-package imenu-anywhere
  :ensure t
  :pin melpa-stable
  :bind ("M-i" . imenu-anywhere))

;; white space
(use-package whitespace
  :diminish whitespace-mode
  :config
  (add-hook 'prog-mode-hook 'whitespace-mode)
  (setq-default whitespace-line-column 100
                whitespace-style '(face lines-tail trailing)))

;; indentation
(use-package aggressive-indent
  :ensure t
  :defer t
  :pin melpa)

(defun top-join-line ()
  "Join the current line with the line beneath it"
  (interactive)
  (delete-indentation 1))
(global-set-key (kbd "C-^") 'top-join-line)

(defun open-next-line (arg)
  "Open line below and indent"
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (indent-according-to-mode))
(global-set-key (kbd "M-o") 'open-next-line)

(defun open-previous-line (arg)
  "Open line above and indent"
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (indent-according-to-mode))
(global-set-key (kbd "M-O") 'open-previous-line)

(defun move-line-up ()
  "Move line up"
  (interactive)
  (transpose-lines 1)
  (previous-line 2))
(global-set-key (kbd "M-p") 'move-line-up)

(defun move-line-down ()
  "Move line down"
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))
(global-set-key (kbd "M-n") 'move-line-down)

;; kill buffer without prompt
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; switch buffers
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

;; window move
(windmove-default-keybindings 'meta)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)

(provide 'om-core)
