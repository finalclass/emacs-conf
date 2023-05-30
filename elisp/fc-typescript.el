(use-package typescript-mode
  :config)

(use-package typescript-mode
  :ensure t
  ;:mode "\\.ts\\'"
  :after tree-sitter
  :config
  ;; we choose this instead of tsx-mode so that eglot can automatically figure out language for server
  ;; see https://github.com/joaotavora/eglot/issues/624 and https://github.com/joaotavora/eglot#handling-quirky-servers
  (define-derived-mode tsx-mode typescript-mode
    "TypeScript TSX")

  ;(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-mode))

  ;; by default, typescript-mode is mapped to the treesitter typescript parser
  ;; use our derived mode to map both .tsx AND .ts -> tsx-mode -> treesitter tsx
  (add-to-list 'tree-sitter-major-mode-language-alist '(fc-deno-mode . tsx))
  (add-to-list 'tree-sitter-major-mode-language-alist '(tsx-mode . tsx)))

(defun deno-project-p ()
  (let ((root (projectile-project-root)))
    (unless (null root)
      (let ((config1 (concat root "deno.jsonc"))
            (config2 (concat root "deno.json")))
	(and
         (not (string-match-p "front" (buffer-file-name)))
         (not (string-match-p "admin" (buffer-file-name)))
         (or (file-exists-p config1) (file-exists-p config2)))))))

(use-package deno-fmt
  :ensure t
  :config
  (add-hook 'javascript-mode-hook 'deno-fmt-mode)
  (add-hook 'fc-deno-mode-hook 'deno-fmt-mode)
  (add-hook 'tsx-mode-hook 'deno-fmt-mode)
  (add-hook 'typescript-mode-hook 'deno-fmt-mode))

(define-derived-mode fc-deno-mode tsx-mode "Deno Mode"
  "Major mode for editing deno files")

(defun is-js-file ()
  (or
   (string= (file-name-extension buffer-file-name) "ts")
   (string= (file-name-extension buffer-file-name) "js")))

(defun is-js-file ()
  (and buffer-file-name
       (or (string= (downcase (file-name-extension buffer-file-name)) "ts")
           (string= (downcase (file-name-extension buffer-file-name)) "js"))))


(defun is-jsx-file ()
  (or
   (string= (file-name-extension buffer-file-name) "tsx")
   (string= (file-name-extension buffer-file-name) "jsx")))
   

(define-derived-mode fc-deno-mode tsx-mode "Deno Mode"
  "Major mode for editing deno files")

(defun setup-ts-mode ()
  "Set up deno-mode if deno.jsonc is present in the root directory."
  (interactive)
  (message (concat "Setting up ts-mode for " buffer-file-name))
  (if (deno-project-p)
      (fc-deno-mode)
    (if (is-jsx-file)
	(tsx-mode)
      (typescript-mode)))
  (if (or (is-jsx-file) (is-js-file))
      (eglot-ensure)
  ()))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . setup-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . setup-ts-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . setup-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . setup-ts-mode))

(add-hook 'after-find-file #'setup-ts-mode t)

(defclass eglot-deno (eglot-lsp-server) ()
  :documentation "A custom class for deno lsp.")

 (cl-defmethod eglot-initialization-options ((server eglot-deno))
    "Passes through required deno initialization options"
    (list :enable t
    :lint t))

(with-eval-after-load 'eglot
  (cl-pushnew '((js-mode typescript-mode tsx-mode) . ("typescript-language-server" "--stdio"))
             eglot-server-programs
              :test #'equal)
  
  (add-to-list 'eglot-server-programs '((fc-deno-mode) . (eglot-deno "deno" "lsp"))))



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
