;; (setq custom--inhibit-theme-enable nil)
;; (use-package darcula-theme :ensure t)
;; (load-theme 'darcula)
(use-package gruvbox-theme :ensure t)
(load-theme 'gruvbox-dark-medium t)
;;(use-package zenburn-theme :ensure t)
;; (use-package ample-theme :ensure t)
;; (load-theme 'ample-flat t)
;; (load-theme 'zenburn t)

(tool-bar-mode -1)
(set-frame-font "Inconsolata-20")
(add-to-list 'default-frame-alist '(font . "Inconsolata-20"))
(fset 'yes-or-no-p 'y-or-n-p)
(setq visible-bell nil)
(show-paren-mode t)
(pending-delete-mode t)
(setq ns-alternate-modifier 'meta)
(setq ns-right-alternate-modifier nil)
(menu-bar-mode -1)

;; (setq inhibit-splash-screen t) ; hide welcome screen (show scratch instead)
(setq initial-buffer-choice "~/gdrive/7willows/todo.org")

(require 'doremi)
(require 'doremi-cmd)
(require 'doremi-frm)
(winner-mode)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(global-hl-line-mode 1)


					; linu numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(line-number-mode t)
(column-number-mode t)
