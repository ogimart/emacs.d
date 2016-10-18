;; ogimart-helm.el
;;
;; uses: helm, helm-projectile, helm-ag

(use-package helm
  :ensure helm
  :pin melpa-stable
  :diminish t
  :config
  (progn
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (global-set-key (kbd "C-x b") 'helm-mini)
    (global-set-key (kbd "M-x") 'helm-M-x)

    (setq
     helm-split-window-in-side-p           t
     helm-move-to-line-cycle-in-source     t
     helm-ff-search-library-in-sexp        t
     helm-scroll-amount                    8
     helm-ff-file-name-history-use-recentf t
     helm-autoresize-max-height           25
     helm-autoresize-min-height           25)

    (helm-autoresize-mode nil)
    (helm-mode 1)

    (use-package helm-ag
      :ensure helm-ag
      :pin melpa-stable
      :bind ("C-c a" . helm-ag)
      :config
      (custom-set-variables
       '(helm-ag-insert-at-point 'symbol)))

    (after 'projectile
      (use-package helm-projectile
        :ensure helm-projectile
        :pin melpa-stable
        :config
        (helm-projectile-on)))))

(provide 'ogimart-helm)
