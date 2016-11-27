;; om-eshell
;;
;; uses: eshell

(use-package eshell
  :config
  (progn

    (defmacro with-face (str &rest properties)
      `(propertize ,str 'face (list ,@properties)))

    (after 'projectile

      (defun eshell/git-branch ()
        (if (executable-find "git")
            (let ((branch (car
                           (split-string
                            (shell-command-to-string
                             "git rev-parse --abbrev-ref HEAD") "\n"))))
              (if (string= (car (split-string branch ":")) "fatal")
                  "" (concat " [" branch "]")))
          ""))

      (defun eshell/venv ()
        (if venv-current-name
            (concat "[" venv-current-name "] ")
          ""))

      (setq eshell-prompt-function
            (lambda ()
              (concat
               "\n"
               (with-face (eshell/venv)
                          :foreground "#2aa198")
               (with-face (concat "[" (eshell/pwd) "]")
                          :foreground "#268bd2")
               (with-face (eshell/git-branch)
                          :foreground "#6c71c4")
               (with-face "\n> ")))
            eshell-prompt-regexp (concat "^" (regexp-quote "> "))))))

(provide 'om-eshell)
