(use-package company-restclient :ensure t)

(use-package restclient
  :ensure t
  :hook (restclient-mode . company-mode)
  :config
  (setq restclient-inhibit-cookies 1)
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-restclient))
  
  (add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode)))
