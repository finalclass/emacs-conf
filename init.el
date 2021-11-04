(package-initialize)

;; ORG
(setq org-replace-disputed-keys t)

(require 'org)
(require 'ob-tangle)

;; Load loader.org
(setq init-dir (file-name-directory (or load-file-name (buffer-file-name))))
(org-babel-load-file (expand-file-name "loader.org" init-dir))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(js-indent-level 4)
 '(js2-auto-indent-p t)
 '(js2-consistent-level-indent-inner-bracket t)
 '(js2-enter-indents-newline t)
 '(js2-include-node-externs t)
 '(js2-indent-level 4)
 '(js2-indent-on-enter-key t)
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(js2-strict-inconsistent-return-warning nil)
 '(js2-strict-missing-semi-warning nil)
 '(js2-strict-trailing-comma-warning nil)
 '(js2-toggle-warnings-and-errors nil)
 '(org-agenda-files '("~/todo-home.org"))
 '(package-selected-packages
   '(ample-theme material-theme tomorrow-night-paradise-theme tomorrow-theme blackboard-theme base16-theme spacemacs-theme zenburn-theme epresent lsp-ui lsp-dart dart-mode eglot markdown-preview-mode toml-mode rust-mode company-go go-autocomplete go-mode jade-mode coffee-mode yaml-mode dockerfile-mode company-restclient json-mode js2-mode eslintd-fix elm-mode tide emmet-mode web-mode company-php eproject erlang company-quickhelp flycheck-credo exunit reformatter elixir-mode yasnippet undo-tree expand-region multiple-cursors yafolding popwin editorconfig git-gutter company-box company lsp-mode counsel helm-projectile swiper matrix-client frame-purpose rainbow-identifiers ht esxml kv tracking ov a request dash-functional anaphora magit dumb-jump mwim which-key ag smex ido-at-point ido-vertical-mode flx-ido org-bullets ob-http xah-fly-keys quelpa-use-package ob-html-chrome diminish darcula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
