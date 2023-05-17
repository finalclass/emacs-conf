(use-package typescript-mode
  :config)

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :after tree-sitter
  :config
  ;; we choose this instead of tsx-mode so that eglot can automatically figure out language for server
  ;; see https://github.com/joaotavora/eglot/issues/624 and https://github.com/joaotavora/eglot#handling-quirky-servers
  (define-derived-mode tsx-mode typescript-mode
    "TypeScript TSX")

  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-mode))

  ;; by default, typescript-mode is mapped to the treesitter typescript parser
  ;; use our derived mode to map both .tsx AND .ts -> tsx-mode -> treesitter tsx
  (add-to-list 'tree-sitter-major-mode-language-alist '(tsx-mode . tsx)))

(defun deno-project-p ()
  (let ((root (projectile-project-root)))
    (unless (null root)
      (let ((config1 (concat root "deno.jsonc"))
            (config2 (concat root "deno.json")))
        (or (file-exists-p config1) (file-exists-p config2))))))

(defun fmt-for-deno ()
  (if (deno-project-p)
      (deno-fmt-mode)))

(use-package deno-fmt
  :ensure t
  :config
  (add-hook 'javascript-mode-hook #'fmt-for-deno)
  (add-hook 'typescript-mode-hook #'fmt-for-deno))

; DENO
(unless (display-graphic-p)
  (add-to-list 'load-path "~/.emacs.d/acm-terminal")
  (with-eval-after-load 'acm
    (require 'acm-terminal)))


;;(print lsp-bridge-single-lang-server-mode-list)

;;(setq lsp-bridge-get-single-lang-server-by-project
 ;;     (lambda (project-path filepath)
;;	(if (and (deno-project-p)
 ;;                (or
 ;;                 (string-equal (file-name-extension filepath) "ts")
 ;;                 (string-equal (file-name-extension filepath) "tsx")
;;                  )
;;		 (not (or
;;                       (string-match-p "front" filepath)
;;                       (string-match-p "admin" filepath)
;;
;;                       )))

;;	    "deno";
;;	  )))
          
	    
	    ;; ;; (return "deno")))))
            ;; (dolist (buf (buffer-list))
            ;;   (when (string-equal (buffer-file-name buf) filepath)
            ;;     (with-current-buffer buf
            ;;       (goto-char (point-min))
            ;;       (when (search-forward-regexp (regexp-quote "from \"https://deno.land") nil t)
            ;;         (return "deno")))))))))


;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (init-js-flycheck)
;;   (flycheck-mode +1)
;;   (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (eslintd-fix-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   (company-mode +1))

;; (use-package tide
;;   :ensure t
;;   :config
;;   (setq company-tooltip-align-annotations t)
;;   (setq company-tooltip-align-annotations t)
;;   (add-hook 'before-save-hook 'tide-format-before-save)
;;   ; start it manually instead
;;   ;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
;;   )

;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (string-equal "tsx" (file-name-extension buffer-file-name))
;;               (typescript-mode))))

;; (flycheck-add-mode 'typescript-tslint 'web-mode)
