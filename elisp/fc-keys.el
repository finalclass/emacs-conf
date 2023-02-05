(global-unset-key (kbd "M-m"))
(global-set-key (kbd "M-g M-g") 'goto-line)
(global-set-key (kbd "C-\\") 'fc-format-line)
(global-set-key (kbd "C-<up>") (lambda () (interactive) (previous-line 5)))
(global-set-key (kbd "C-<down>") (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "C-<backspace>") 'fc-backward-delete-word)
(global-set-key (kbd "C-<delete>") 'fc-delete-word)
(global-set-key (kbd "M-m o o") 'occur)
(global-set-key (kbd "<home>") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "M-m w") 'fc-whitespace-cleanup)
(global-set-key (kbd "C-q") 'xah-cut-line-or-region)
(global-set-key (kbd "M-q") 'xah-copy-line-or-region)
(global-set-key (kbd "<M-left>") 'previous-buffer)
(global-set-key (kbd "<M-right>") 'next-buffer)
(global-set-key (kbd "M-m ;") 'fc-toggle-comment-on-region-or-line)
(global-set-key (kbd "C-n") 'make-frame-command)
(global-set-key (kbd "M-m n") 'make-frame-command)
(global-set-key (kbd "C-S-b") 'windmove-left)
(global-set-key (kbd "C-S-f") 'windmove-right)
(global-set-key (kbd "C-S-p") 'windmove-up)
(global-set-key (kbd "C-S-n") 'windmove-down)
(global-set-key (kbd "M-m s <right>") 'doremi-window-width+)
(global-set-key (kbd "M-m s <left>") 'doremi-window-width+)
(global-set-key (kbd "M-m s <up>") 'doremi-window-height+)
(global-set-key (kbd "M-m s <down>") 'doremi-window-height+)
(global-set-key (kbd "C-p") 'mc/mark-next-like-this)
(global-set-key (kbd "S-C-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c p") 'mc/mark-all-like-this)
(define-key mc/keymap (kbd "<return>") nil)
(global-set-key (kbd "C-f") 'er/expand-region)
(global-set-key (kbd "M-m e n") 'next-error)
(global-set-key (kbd "M-m e p") 'previous-error)
(global-set-key (kbd "C-b") 'yas-expand)
(global-set-key (kbd "M-<up>") 'scroll-down-line)
(global-set-key (kbd "M-<down>") 'scroll-up-line)
(global-set-key (kbd "M-m r s") 'lsp-rename)
(global-set-key (kbd "M-m g s") 'magit-status)
(global-set-key (kbd "C-?") 'lsp-ui-doc-trigger)
(global-set-key (kbd "C-;") 'company-complete)
(global-set-key (kbd "M-m k") 'revert-buffer)
(global-set-key (kbd "M-m s g") 'counsel-ag)
(global-set-key (kbd "M-m s a") 'ag)
(global-set-key (kbd "M-m .") 'dumb-jump-go)
(global-set-key (kbd "M-m b") 'ivy-switch-buffer)
(global-set-key (kbd "M-m s s") 'swiper)
(global-set-key (kbd "M-m s r") 'ivy-resume)
(global-set-key (kbd "M-m h f") 'counsel-describe-function)
(global-set-key (kbd "M-m h v") 'counsel-describe-variable)
(global-set-key (kbd "M-m h k") 'describe-key)
(global-set-key (kbd "M-m f g") 'counsel-git)
(global-set-key (kbd "M-m f f") 'counsel-locate)
(global-set-key (kbd "M-m s g") 'counsel-git-grep)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "M-m c") 'fc-toggle-case)
(global-set-key (kbd "M-m m m") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "M-m m e") 'kmacro-end-or-call-macro)
(global-set-key (kbd "M-m m s") 'kmacro-bind-to-key)
(global-set-key (kbd "M-m j") 'fc-remove-whitespace)
(global-set-key (kbd "M-m g l") 'fc-kill-gitea-address)
(global-set-key (kbd "M-.") 'lsp-bridge-find-def)
(global-set-key (kbd "M-,") 'lsp-bridge-find-def-return)
(global-set-key (kbd "M-m l n") 'lsp-bridge-diagnostic-jump-next)
(global-set-key (kbd "M-m l p") 'lsp-bridge-diagnostic-jump-prev)
(global-set-key (kbd "M-m l r") 'lsp-bridge-rename)
(global-set-key (kbd "M-m l a") 'lsp-bridge-code-action)
(global-set-key (kbd "M-m l k") 'lsp-bridge-restart-process)

(define-key dired-mode-map [C-up] ()) ; previously was set to 'diredp-visit-previous-file
(define-key dired-mode-map [C-down] ()) ; previously was set to 'diredp-visit-next-file
(define-key dired-mode-map (kbd ",") 'dired-hide-details-mode)

(define-key yafolding-mode-map (kbd "<C-S-return>") nil)
(define-key yafolding-mode-map (kbd "<C-M-return>") nil)
(define-key yafolding-mode-map (kbd "<C-return>") nil)
(define-key yafolding-mode-map (kbd "C--") 'yafolding-toggle-element)
(define-key yafolding-mode-map (kbd "C-_") 'yafolding-toggle-all)

(define-key elixir-mode-map (kbd "M-m f") 'elixir-format)

(define-key elm-mode-map (kbd "M-m f") 'elm-format-buffer)

(define-key projectile-mode-map (kbd "M-m p") 'projectile-command-map)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
