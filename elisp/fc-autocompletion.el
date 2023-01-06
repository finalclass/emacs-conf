(use-package lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook
  (elixir-mode . lsp)
  (js2-mode . lsp)
  :init
  (add-to-list 'exec-path "/home/sel/.emacs.d/elixir_ls"))

(use-package lsp-ui
  :ensure t
  :requires lsp-mode flycheck
  :commands lsp-ui-mode  )

(use-package company
  :ensure t)
  
(setq company-idle-delay 0)
(setq company-dabbrev-downcase nil) ; this way company in text does not downcase everything
(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package eglot :ensure t)
