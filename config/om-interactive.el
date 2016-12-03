;; om-interactive.el
;;
;; uses: god-mode

;; join the current line with the line beneath it
(defun top-join-line ()
  (interactive)
  (delete-indentation 1))
(global-set-key (kbd "C-^") 'top-join-line)

;; Behave like vi's o command
(defun open-next-line (arg)
  "Move to the next line and then opens a line."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))
(global-set-key (kbd "C-o") 'open-next-line)

;; Behave like vi's O command
(defun open-previous-line (arg)
  "Open a new line before the current."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))
(global-set-key (kbd "M-o") 'open-previous-line)

;; move line up
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line 2))
(global-set-key (kbd "M-p") 'move-line-up)

;; move line down
(defun move-line-down ()
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))
(global-set-key (kbd "M-n") 'move-line-down)

;; kill buffer without prompt
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; use tab for indent or complete
(setq tab-always-indent 'complete)

;; switch buffers
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

;; window move
(windmove-default-keybindings 'meta)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)

(use-package god-mode
  :ensure god-mode
  :pin melpa
  :bind ("<escape>" . god-mode-all)
  :config
  (progn
    (define-key god-local-mode-map (kbd "z") 'repeat)
    (defun god-update-cursor ()
      (setq cursor-type
            (if (or god-local-mode buffer-read-only)
                'hollow 'box)))
    (add-hook 'god-mode-enabled-hook 'god-update-cursor)
    (add-hook 'god-mode-disabled-hook 'god-update-cursor)))

(after 'god-mode
  (use-package god-mode-isearch
    :config
    (progn
      (define-key isearch-mode-map (kbd "<escape>") 'god-mode-isearch-activate)
      (define-key god-mode-isearch-map (kbd "<escape>") 'gode-mode-isearch-disable))))

(provide 'om-interactive)
