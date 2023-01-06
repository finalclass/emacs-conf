(use-package ido
  :ensure t
  :config
  (progn
    (use-package flx-ido :ensure t)
    (use-package ido-vertical-mode :ensure t)
    (use-package ido-at-point :ensure t)
    (use-package smex
      :ensure t
      :init (smex-initialize)
      (ido-mode 1))
    
    (ido-vertical-mode 1)
    (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
    (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
    (ido-everywhere 1)
    (flx-ido-mode 1)
    (setq ido-use-faces nil)))
