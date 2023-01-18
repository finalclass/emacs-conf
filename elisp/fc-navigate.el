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
      (setq ivy-count-format "(%d/%d) "))

(use-package ido
  :ensure t
  :config
  (setq ido-everywhere t)
  (ido-mode 1))

(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1))

(use-package ido-grid-mode
  :ensure t
  :config
  (ido-grid-mode 1))
