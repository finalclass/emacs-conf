
(use-package company
  :hook
  ((eglot--managed-mode . company-mode))
  :ensure t)
  
(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t)

(add-hook 'prog-mode-hook 'copilot-mode)

(use-package eglot
  :ensure t
  ;; :hook
  ;; ((js-mode . eglot-ensure)
  ;;  (tsx-mode . eglot-ensure)
  ;;  (typescript-mode . eglot-ensure))
  :config
  (setq eglot-sync-connect 0))

(defun fc-eglot-restart ()
  (interactive)
  (eglot-shutdown (eglot-current-server))
  (eglot-ensure))
