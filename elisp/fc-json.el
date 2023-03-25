(defun json-pretty-print-buffer-on-save ()
  "Pretty print JSON buffer on save."
  (when (eq major-mode 'json-mode)
    (json-pretty-print (point-min) (point-max))))
(add-hook 'before-save-hook #'json-pretty-print-buffer-on-save)
