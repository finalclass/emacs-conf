(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (init-js-flycheck)
  (flycheck-mode +1)
  ;; (setq flycheck-checker 'javascript-eslint)
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (eslintd-fix-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(use-package tide
  :ensure t
  :config
  (setq company-tooltip-align-annotations t)
  ;; (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; eglot alternative (for deno?) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'eglot-server-programs '((js-mode typescript-mode) . (eglot-deno "deno" "lsp")))

(defclass eglot-deno (eglot-lsp-server) ()
  :documentation "A custom class for deno lsp.")

(cl-defmethod eglot-initialization-options ((server eglot-deno))
  "Passes through required deno initialization options"
  (list :enable t
	:lint t))

(use-package deno-fmt
  :ensure t
  :config
  (add-hook 'eglot--managed-mode 'deno-fmt-mode))
