(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xhtml?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html.eex?\\'" . web-mode))
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (company-mode t)
    (setq web-mode-enable-auto-closing t)
    (setq web-mode-enable-auto-quoting t)
    (setq web-mode-enable-current-element-highlight t)
    (setq web-mode-enable-current-column-highlight t)
    (setq web-mode-markup-indent-offset 2))
  
  (add-hook 'web-mode-hook  'my-web-mode-hook))

(defun initialize-emmet-only-for-tsx-files ()
  (when (string= "tsx" (file-name-extension buffer-file-name))
    (emmet-mode)))

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'web-mode-hook '(lambda () (emmet-mode)))
  ;; initialize emmet-mode only for tsx files:
  (add-hook 'typescript-mode-hook 'initialize-emmet-only-for-tsx-files)
  )



(add-hook 'css-mode-hook 'company-mode)
