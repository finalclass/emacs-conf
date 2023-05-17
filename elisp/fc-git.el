(use-package magit
  :ensure t
  :commands magit-get-top-dir)

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1))

(defun fc-get-relative-file-path ()
  (if (buffer-file-name)
      (fc-get-regular-file-path)
    (fc-get-git-preview-file-path)))

(defun fc-get-git-preview-file-path ()
  (substring (first (split-string (buffer-name) "~")) 0 -1))

(defun fc-get-regular-file-path ()
  (let (
	(root-dir (project-root (project-current)))
	(abs-path (file-truename (buffer-file-name)))
	)
    (file-relative-name abs-path root-dir)))

(defun fc-line-or-selected-lines ()
  (if (region-active-p)
      (fc-get-region-line-numbers)
    (concat "L" (number-to-string (line-number-at-pos)))))

(defun fc-get-region-line-numbers ()
  (concat
   "L"
   (number-to-string (line-number-at-pos (region-beginning)))
   "-L"
   (number-to-string (line-number-at-pos (region-end)))))

(fc-get-relative-file-path)

(defun fc-get-project-name()
  (first
   (split-string
    (car
     (last
      (split-string
       (shell-command-to-string "git config --get remote.origin.url")
       "/")))
    "\\.git")))

(defun fc-get-current-git-commit ()
  (substring (shell-command-to-string "git rev-parse HEAD") 0 -1))

(defun fc-get-gitea-url ()
  (concat
   "https://gitea.7willows.com/7willows/"
   (fc-get-project-name)
   "/src/commit/"
   (fc-get-current-git-commit)
   "/"
   (fc-get-relative-file-path)
   "#"
   (fc-line-or-selected-lines)))

(defun fc-kill-gitea-address ()
  (interactive)
  (message
   (kill-new
    (fc-get-gitea-url))))
