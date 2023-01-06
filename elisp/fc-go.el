(defun my-go-mode-hook ()
					; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
					; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))


(use-package go-mode
  :ensure t
  :config
  (add-to-list 'exec-path "/Users/tleyden/Development/gocode/bin")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'my-go-mode-hook))

(use-package go-autocomplete
  :ensure t)

(use-package company-go
  :ensure t
  :config
  (add-hook 'go-mode-hook (lambda ()
                            (set (make-local-variable 'company-backends) '(company-go))
                            (company-mode)))
  (add-hook 'go-mode-hook 'flycheck-mode))
