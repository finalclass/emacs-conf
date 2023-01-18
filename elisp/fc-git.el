(use-package magit
  :ensure t
  :commands magit-get-top-dir)

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1))

;; (defun fc-copy-gitea-address ()
;;   "Copy the gitea address of the current file."
;;   (interactive)
;;   (let ((file (buffer-file-name))
;;         (top-dir (magit-get-top-dir)))
;;     (when (and file top-dir)
;;       (kill-new (concat "http://gitea.fcwu.tw/"
;;                         (file-relative-name file top-dir))))))

(defun fc-get-relative-file-path ()
  (let (
	(root-dir (project-root (project-current)))
	(abs-path (buffer-file-name))
	)
    (file-relative-name abs-path root-dir)
    )
  )

;(fc-get-relative-file-path)
