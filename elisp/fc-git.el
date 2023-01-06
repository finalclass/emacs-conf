(use-package magit
  :ensure t
  :commands magit-get-top-dir)

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1))
