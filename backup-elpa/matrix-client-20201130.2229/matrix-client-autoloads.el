;;; matrix-client-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "matrix-api-r0.3.0" "matrix-api-r0.3.0.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from matrix-api-r0.3.0.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matrix-api-r0.3.0" '("funcall-when" "matrix-")))

;;;***

;;;### (autoloads nil "matrix-bufler" "matrix-bufler.el" (0 0 0 0))
;;; Generated autoloads from matrix-bufler.el

(when (require 'bufler nil t) (bufler-defauto-group matrix (when (or (member (buffer-local-value 'major-mode buffer) '(matrix-client-mode matrix-room-list-mode)) (string-match-p (rx bos "*Matrix") (buffer-name buffer))) "Matrix")) (bufler-defauto-group matrix-room (when (member (buffer-local-value 'major-mode buffer) '(matrix-client-mode)) "Rooms")) (bufler-defauto-group matrix-room-direct (when (matrix-room-direct-p (buffer-local-value 'matrix-client-room buffer)) "Direct")) (bufler-defauto-group matrix-room-tag (when (member (buffer-local-value 'major-mode buffer) '(matrix-client-mode)) (pcase-let* ((room (buffer-local-value 'matrix-client-room buffer)) (`(,tags ,favorite-p ,low-priority-p) (matrix-client-room-list--tags room))) (cond ((not (string-empty-p tags)) tags) (favorite-p "Favorites") (low-priority-p "Low priority") ((matrix-room-direct-p (oref room id) (car matrix-client-sessions)) "Direct") (t "Other"))))) (bufler-define-column "Members" (ignore depth) (when-let* ((room (buffer-local-value 'matrix-client-room buffer))) (file-size-human-readable (length (oref room members))))) (bufler-define-column "Last message" (ignore depth) (when-let* ((room (buffer-local-value 'matrix-client-room buffer)) (timeline (oref room timeline))) (format-time-string "%Y-%m-%d %H:%M:%S" (matrix-client-event-timestamp (car timeline))))) (bufler-define-column "Buffer" nil (if (buffer-local-value 'matrix-client-room buffer) (let* ((room (buffer-local-value 'matrix-client-room buffer)) (matrix-client-show-room-avatars-in-buffer-names nil)) (matrix--room-display-name room)) (buffer-name buffer))) (bufler-define-column "🐱" nil (if-let* ((room (buffer-local-value 'matrix-client-room buffer)) (avatar (oref room avatar)) (resized (matrix-client-resize-avatar avatar))) (concat (make-string (* 2 depth) 32) (substring resized 0 1)) (concat (make-string (* 2 depth) 32) " "))) (defun matrix-client-not-matrix-buffer-p (buffer) "Return non-nil if BUFFER is NOT a Matrix buffer." (not (or (member (buffer-local-value 'major-mode buffer) '(matrix-client-mode matrix-room-list-mode)) (string-match-p (rx bos "*Matrix") (buffer-name buffer))))) (defun matrix-bufler nil "Show Matrix rooms in Bufler." (interactive) (let ((bufler-groups (bufler-defgroups (group (bufler-group 'auto-matrix-room) (bufler-group 'auto-matrix-room-tag)) (group (name-match "*Special*" (rx bos "*"))))) (bufler-filter-fns '(matrix-client-not-matrix-buffer-p)) (bufler-columns '("🐱" "Buffer" "Members")) (matrix-client-room-avatar-in-buffer-name-size (* 2 (default-font-width)))) (save-window-excursion (bufler)) (when-let* ((window (display-buffer-in-side-window (get-buffer "*Bufler*") '((side . right))))) (set-window-parameter window 'delete-window #'ignore) (select-window window)))))

;;;***

;;;### (autoloads nil "matrix-client" "matrix-client.el" (0 0 0 0))
;;; Generated autoloads from matrix-client.el

(autoload 'matrix-client-connect "matrix-client" "\
Connect to the Matrix.
If already connected, `already-active' is returned; if
connecting, non-nil.

\(fn &optional USER PASSWORD ACCESS-TOKEN SERVER)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matrix-client" '("matrix-")))

;;;***

;;;### (autoloads nil "matrix-client-frame" "matrix-client-frame.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from matrix-client-frame.el

(autoload 'matrix-client-frame "matrix-client-frame" "\
Open and return the Matrix Client frame on SIDE.
SIDE may be `left', `right', `top', or `bottom'.

Only one such frame should be open at a time.  If more than one
is, only the latest one will have its sidebar updated
automatically.

\(fn &optional SIDE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matrix-client-frame" '("matrix-client-")))

;;;***

;;;### (autoloads nil "matrix-client-images" "matrix-client-images.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from matrix-client-images.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matrix-client-images" '("matrix-client-")))

;;;***

;;;### (autoloads nil "matrix-client-modes" "matrix-client-modes.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from matrix-client-modes.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matrix-client-modes" '("matrix-client-mode")))

;;;***

;;;### (autoloads nil "matrix-client-rainbow" "matrix-client-rainbow.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from matrix-client-rainbow.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matrix-client-rainbow" '("global-matrix-client-rainbow-mode" "matrix-client-r")))

;;;***

;;;### (autoloads nil "matrix-client-room" "matrix-client-room.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from matrix-client-room.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matrix-client-room" '("matrix-")))

;;;***

;;;### (autoloads nil "matrix-client-room-list" "matrix-client-room-list.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from matrix-client-room-list.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matrix-client-room-list" '("matrix-client-room-list")))

;;;***

;;;### (autoloads nil "matrix-helpers" "matrix-helpers.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from matrix-helpers.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matrix-helpers" '("a-get*" "matrix-" "oref*" "oset-multi")))

;;;***

;;;### (autoloads nil "matrix-macros" "matrix-macros.el" (0 0 0 0))
;;; Generated autoloads from matrix-macros.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matrix-macros" '("a-get*" "format$" "if-fn-apply" "matrix-url-with-retrieve-async-timeout-timer" "oref*" "with-")))

;;;***

;;;### (autoloads nil "matrix-notifications" "matrix-notifications.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from matrix-notifications.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "matrix-notifications" '("matrix-client-")))

;;;***

;;;### (autoloads nil "ordered-buffer" "ordered-buffer.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from ordered-buffer.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ordered-buffer" '("ordered-buffer-")))

;;;***

;;;### (autoloads nil nil ("matrix-client-faces.el" "matrix-client-pkg.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; matrix-client-autoloads.el ends here
