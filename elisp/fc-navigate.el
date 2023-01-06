(use-package ag
  :ensure t)

(use-package dumb-jump
  :ensure t
  :config
  (setq dumb-jump-selector 'ivy)
  :commands dumb-jump-go)

(use-package counsel :ensure t)

(use-package ivy
    :ensure t
    :config
      (setq ivy-use-virtual-buffers t)
      (setq ivy-count-format "(%d/%d) ")
      (ivy-mode 1))

