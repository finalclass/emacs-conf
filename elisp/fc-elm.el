(use-package elm-mode
  :ensure t
  :config
  (setq elm-format-on-save t)
  ;; (setq lsp-elm-server-install-dir "/home/sel/Documents/finalclass/elm-language-server")
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-elm))
  (add-hook 'elm-mode-hook
            (lambda ()
              (company-mode +1))))
