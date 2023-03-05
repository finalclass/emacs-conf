(defun mark-inner/pair-bracket (sign)
  (cond
   ((string-equal sign "'") "'")
   ((string-equal sign "\"") "\"")
   ((string-equal sign "(") ")")
   ((string-equal sign "[") "]")
   ((string-equal sign "{") "}")
   ((string-equal sign ")") "(")
   ((string-equal sign "]") "[")
   ((string-equal sign "}") "{")
   (t nil)))

(defun mark-inner/select-inside (beg end)
  (search-backward beg (line-beginning-position) t)
  (forward-char)
  (set-mark (point))
  (search-forward end (line-end-position) t)
  (backward-char)
  )

(defun mark-inner/select-later (beg end)
  (search-forward beg (line-end-position) t)
  (set-mark (point))
  (search-forward end (line-end-position) t)
  (backward-char)
  )

(defun mark-inner/select-earlier (beg end)
  (search-backward end (line-beginning-position) t)
  (backward-char)
  (search-backward beg (line-beginning-position) t)
  (forward-char)
  (set-mark (point))
  (search-forward end (line-end-position) t)
  (backward-char)
  )

(defun mark-inner/im-inside (beg end)
  (save-excursion
    (and
     (search-backward beg (line-beginning-position) t)
     (forward-char)
     (search-forward end (line-end-position) t)
     )))

(defun mark-inner/is-later (beg end)
  (save-excursion
    (and
     (search-forward beg (line-end-position) t)
     (search-forward end (line-end-position) t)
     )))

(defun mark-inner/is-earlier (beg end)
  (save-excursion
    (and
     (search-backward beg (line-beginning-position) t)
     (search-backward end (line-beginning-position) t)
     )))

(defun mark-inner ()
  (interactive)
  (let ((user-input (list (read-char-exclusive "Enter delimiter: "))))
    (let ((delimiter-beg (char-to-string (car user-input))))
      (let ((delimiter-end (mark-inner/pair-bracket delimiter-beg)))
	(cond 
	 ((mark-inner/im-inside delimiter-beg delimiter-end)
	  (mark-inner/select-inside delimiter-beg delimiter-end)) 
	 ((mark-inner/is-later delimiter-beg delimiter-end)
	  (mark-inner/select-later delimiter-beg delimiter-end))
	 ((mark-inner/is-earlier delimiter-beg delimiter-end)
	  (mark-inner/select-earlier delimiter-beg delimiter-end))
	 (t (message "not found")))
	))))
	
