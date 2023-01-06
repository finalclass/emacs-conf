;;; exunit-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "exunit" "exunit.el" (0 0 0 0))
;;; Generated autoloads from exunit.el

(autoload 'exunit-mode "exunit" "\
Minor mode for ExUnit test runner

This is a minor mode.  If called interactively, toggle the
`ExUnit mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `exunit-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(autoload 'exunit-rerun "exunit" "\
Re-run the last test invocation." t nil)

(autoload 'exunit-verify-all "exunit" "\
Run all the tests in the current project." t nil)

(autoload 'exunit-verify-all-in-umbrella "exunit" "\
Run all the tests in the current umbrella project." t nil)

(autoload 'exunit-verify-single "exunit" "\
Run the test under the point." t nil)

(autoload 'exunit-debug "exunit" "\
Run the test under the point in IEx shell.

This allows the usage of IEx.pry method for debugging." t nil)

(autoload 'exunit-verify "exunit" "\
Run all the tests associated with the current buffer." t nil)

(autoload 'exunit-toggle-file-and-test "exunit" "\
Toggle between a file and its tests in the current window." t nil)

(autoload 'exunit-toggle-file-and-test-other-window "exunit" "\
Toggle between a file and its tests in other window." t nil)

(register-definition-prefixes "exunit" '("exunit-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; exunit-autoloads.el ends here
