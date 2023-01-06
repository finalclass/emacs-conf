(defun init-elixir-mode ()
  (push '("|>" . ?▸) prettify-symbols-alist)
  (push '("<<" . ?«) prettify-symbols-alist)
  (push '(">>" . ?») prettify-symbols-alist)
  (push '("<=" . ?≤) prettify-symbols-alist)
  (push '(">=" . ?≥) prettify-symbols-alist)
  (push '("->" . ?→) prettify-symbols-alist)
  (push '("<-" . ?←) prettify-symbols-alist)
  ;; (push '("do" . ?{) prettify-symbols-alist)
  ;; (push '("end" . ?}) prettify-symbols-alist)
  ;; (push '("def" . ?Λ) prettify-symbols-alist)
  ;; (push '("defp" . ?λ) prettify-symbols-alist)
  ;; (push '("defmodule" . ?Ω) prettify-symbols-alist)
  (prettify-symbols-mode t)
  (company-mode 1))

(use-package elixir-mode
  :ensure t
  :config
  ;; (add-hook 'elixir-mode-hook 'eglot-ensure)
  (add-hook 'elixir-mode-hook 'init-elixir-mode))

(use-package exunit
      :ensure t)
