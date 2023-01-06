(use-package dart-mode
  :ensure t)

(use-package lsp-dart
  :ensure t
  :hook (dart-mode . lsp))

;; (setq gc-cons-threshold (* 100 1024 1024)
;;       read-process-output-max (* 1024 1024)
;;       company-minimum-prefix-length 1
;;       lsp-lens-enable t
;;       lsp-signature-auto-activate nil)
