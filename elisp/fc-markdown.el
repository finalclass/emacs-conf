(use-package markdown-mode
  :ensure t
  :mode ("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode)
  :config
  (add-hook
   'markdown-mode-hook
   '(lambda ()
      (substitute-key-definition 'markdown-promote-subtree 'nil markdown-mode-map)
      (substitute-key-definition 'markdown-demote-subtree 'nil markdown-mode-map))))

(use-package markdown-preview-mode
    :ensure t)
