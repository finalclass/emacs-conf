(defun fc-format-line ()
  "Formats line and goes to line below"
  (interactive)
  (indent-for-tab-command)
  (next-line))

(defun fc-backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
    With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))

(defun fc-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
    With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun fc-whitespace-cleanup ()
  (interactive)
  (whitespace-cleanup)
  (message "whitespace-cleanup completed"))

(defun xah-copy-line-or-region ()
  "Copy current line, or text selection.
When `universal-argument' is called first, copy whole buffer (but respect `narrow-to-region')."
  (interactive)
  (let (p1 p2)
    (if (null current-prefix-arg)
        (progn (if (use-region-p)
                   (progn (setq p1 (region-beginning))
                          (setq p2 (region-end)))
                 (progn (setq p1 (line-beginning-position))
                        (setq p2 (line-end-position)))))
      (progn (setq p1 (point-min))
             (setq p2 (point-max))))
    (kill-ring-save p1 p2)))  

(defun xah-cut-line-or-region ()
  "Cut current line, or text selection.
When `universal-argument' is called first, cut whole buffer (but respect `narrow-to-region')."
  (interactive)
  (let (p1 p2)
    (if (null current-prefix-arg)
        (progn (if (use-region-p)
                   (progn (setq p1 (region-beginning))
                          (setq p2 (region-end)))
                 (progn (setq p1 (line-beginning-position))
                        (setq p2 (line-beginning-position 2)))))
      (progn (setq p1 (point-min))
             (setq p2 (point-max))))
    (kill-region p1 p2)))

(use-package mwim
  :ensure t)
  
(defun fc-toggle-comment-on-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)
    (next-line)))

(use-package yafolding
  :ensure t
  :init
  (add-hook 'prog-mode-hook (lambda () (yafolding-mode))))

(use-package multiple-cursors
  :ensure t)

(pending-delete-mode t)

(use-package expand-region
  :ensure t)

(defun fc-toggle-case ()
  "Toggle the case of the character at the point."
  (interactive)
  (let ((char (following-char)))
    (cond
     ((= char (upcase char))
      (delete-char 1)
      (insert (downcase char)))
     ((= char (downcase char))
      (delete-char 1)
      (insert (upcase char))))))
