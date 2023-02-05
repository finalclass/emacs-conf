;; (use-package lsp-mode
;;   :commands lsp
;;   :ensure t
;;   :diminish lsp-mode
;;   :hook
;;   (elixir-mode . lsp)
;;   (js2-mode . lsp)
;;   ;; (typescript-mode . lsp)
;;   :init
;;   (add-to-list 'exec-path "/home/sel/.emacs.d/elixir_ls"))

;; (use-package lsp-ui
;;   :ensure t
;;   :requires lsp-mode flycheck
;;   :commands lsp-ui-mode  )

;; (use-package company
;;   :ensure t)
  
;; (setq company-idle-delay 0)
;; (setq company-dabbrev-downcase nil) ; this way company in text does not downcase everything
;; (use-package company-box
;;   :ensure t
;;   :hook (company-mode . company-box-mode))

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t)

(add-hook 'prog-mode-hook 'copilot-mode)

;; (with-eval-after-load 'company
;;   ;; disable inline previews
;;   (delq 'company-preview-if-just-one-frontend company-frontends))

;; (use-package eglot
;;   :ensure t
;;   :config
;;   (add-hook 'eglot-managed-mode-hook 'company-mode))

;; (add-to-list 'eglot-server-programs '((js-mode typescript-mode) . (eglot-deno "deno" "lsp")))

;; (defclass eglot-deno (eglot-lsp-server) ()
;;   :documentation "A custom class for deno lsp.")

;; (cl-defmethod eglot-initialization-options ((server eglot-deno))
;;   "Passes through required deno initialization options"
;;   (list :enable t
;;         :lint t))

;; LSP BRIDGE
;; https://github.com/manateelazycat/lsp-bridge
(use-package posframe
  :ensure t)

(use-package markdown-mode
  :ensure t)

(add-to-list 'load-path "~/.emacs.d/lsp-bridge")

(require 'lsp-bridge)
(global-lsp-bridge-mode)

(setq lsp-bridge-enable-diagnostics t)
(setq lsp-bridge-enable-hover-diagnostic t)
(setq acm-enable-tabnine nil)

