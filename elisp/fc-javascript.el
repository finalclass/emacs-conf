(defun js2-vars ()
  (setq-default indent-tabs-mode nil)
  (custom-set-variables
   '(js2-auto-indent-p t)
   '(js2-consistent-level-indent-inner-bracket t)
   '(js2-enter-indents-newline t)
   '(js2-strict-missing-semi-warning nil)
   '(js2-indent-level 4)
   '(js-indent-level 4)
   '(js2-basic-offset 4) ; this sets number of spaces
   '(js2-indent-on-enter-key t)
   '(js2-mode-show-parse-errors nil)
   '(js2-mode-show-strict-warnings nil)
   '(js2-toggle-warnings-and-errors)
   '(js2-strict-inconsistent-return-warning nil)
   '(js2-include-node-externs t)
   '(js2-strict-trailing-comma-warning nil)))

(defun rr-js2-tests-filter-warnings ()
  (setq js2-parsed-warnings
        (let (rslt)
          (dolist (e js2-parsed-warnings (reverse rslt))
            (when (not (string= (caar e) "msg.no.side.effects"))
              (setq rslt (cons (caar e) rslt))
              ))
          )))

(defun init-js ()
  (js2-vars)
  (push '("function" . ?λ) prettify-symbols-alist)
  (push '("return" . ?←) prettify-symbols-alist)
  (push '("<=" . ?≤) prettify-symbols-alist)
  (push '(">=" . ?≥) prettify-symbols-alist)
  (hs-minor-mode +1)
  (prettify-symbols-mode t)
  (flycheck-mode t)
  (company-mode t))

(defun init-js-flycheck ()
  
  (setq flycheck-checker-error-threshold 2000)
  
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  (flycheck-add-mode 'javascript-eslint 'js-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (setq flycheck-javascript-eslint-executable "eslint_d")
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (setq-default flycheck-temp-prefix ".flycheck")
  )

(use-package eslintd-fix :ensure t)
(use-package flycheck :ensure t)
(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.mjs$" . js2-mode))
  (add-hook 'js-mode-hook 'init-js)
  (add-hook 'js2-mode-hook 'eslintd-fix-mode)
					; (add-hook 'js2-mode-hook 'setup-tide-mode)
  (init-js-flycheck)
  )
