;; om-java.el
;;
;; uses: eclim, company-emacs-eclim

(use-package eclim
  :ensure t
  :pin melpa-stable
  :config
  (progn
    (setq eclim-eclipse-dirs "/Applications/Eclipse.app/Contents/Eclipse")
    (setq eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim")
    (add-hook 'java-mode-hook 'eclim-mode)))

(use-package company-emacs-eclim
  :ensure t
  :pin melpa-stable
  :config
  (progn
    (after 'company
      (company-emacs-eclim-setup))))

(provide 'om-java)
