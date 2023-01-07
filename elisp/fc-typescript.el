(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :config
  (add-hook 'typescript-mode-hook #'tide-setup))

(use-package deno-fmt
  :ensure t)
  

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (init-js-flycheck)
  (flycheck-mode +1)
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (eslintd-fix-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :config
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-align-annotations t)
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (typescript-mode))))

(flycheck-add-mode 'typescript-tslint 'web-mode)
