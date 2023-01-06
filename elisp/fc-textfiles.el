(use-package json-mode
  :ensure t)

(use-package yaml-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode)))

(use-package toml-mode
   :ensure t
   :init
   (add-to-list 'auto-mode-alist '("\\.toml\\'" . toml-mode)))
