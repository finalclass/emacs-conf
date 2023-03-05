(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :config)

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


(print lsp-bridge-single-lang-server-mode-list)

(setq lsp-bridge-get-single-lang-server-by-project
      (lambda (project-path filepath)
	(if (and (deno-project-p)
                 (or
                  (and 
                   (string-equal (file-name-extension filepath) "tsx")
                   (not (string-match-p "digitall/front" filepath))
                   )
		  (string-equal (file-name-extension filepath) "ts")
                  (string-equal (file-name-extension filepath) "js")
                  )
		 )
	    "deno"
	  )))
          
	    
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
