(add-to-list 'load-path "~/.emacs.d/elisp/")
(load-library "fc-init")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tsdh-light))
 '(custom-safe-themes
   '("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "fa49766f2acb82e0097e7512ae4a1d6f4af4d6f4655a48170d0a00bcb7183970" "19a2c0b92a6aa1580f1be2deb7b8a8e3a4857b6c6ccf522d00547878837267e7" "3e374bb5eb46eb59dbd92578cae54b16de138bc2e8a31a2451bf6fdb0f3fd81b" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "79586dc4eb374231af28bbc36ba0880ed8e270249b07f814b0e6555bdcb71fab" default))
 '(org-agenda-files '("~/todo-home.org"))
 '(package-selected-packages
   '(gruvbox-theme darcula-theme zenburn-theme yasnippet yaml-mode yafolding xah-fly-keys which-key web-mode undo-tree tree-sitter-langs tree-sitter-indent toml-mode tide sql-indent smex rustic quelpa-use-package protobuf-mode popwin org-bullets ob-php ob-http mwim multiple-cursors matrix-client markdown-preview-mode magit lsp-ui lsp-dart json-mode js2-mode jade-mode ido-vertical-mode ido-grid-mode ido-at-point helm-projectile go-autocomplete git-gutter flycheck-credo flx-ido exunit expand-region eslintd-fix erlang eproject epresent emmet-mode elmacro elm-mode elixir-mode eglot editorconfig edbi dumb-jump dockerfile-mode diminish deno-fmt csharp-mode counsel company-tabnine company-restclient company-quickhelp company-php company-go company-box coffee-mode better-jumper anaconda-mode ag))
 '(safe-local-variable-values '((typescript-indent-offset . 2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:foreground "#333333")))))
(put 'narrow-to-region 'disabled nil)
