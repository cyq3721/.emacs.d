;;; ns-auto-titlebar-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from ns-auto-titlebar.el

(defvar ns-auto-titlebar-mode nil "\
Non-nil if Ns-Auto-Titlebar mode is enabled.
See the `ns-auto-titlebar-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ns-auto-titlebar-mode'.")
(custom-autoload 'ns-auto-titlebar-mode "ns-auto-titlebar" nil)
(autoload 'ns-auto-titlebar-mode "ns-auto-titlebar" "\
Set the MacOS transparent titlebar background automatically.

This is a global minor mode.  If called interactively, toggle the
`Ns-Auto-Titlebar mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable the
mode if ARG is nil, omitted, or is a positive number.  Disable the mode
if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='ns-auto-titlebar-mode)'.

The mode's hook is called both when the mode is enabled and when it is
disabled.

(fn &optional ARG)" t)
(register-definition-prefixes "ns-auto-titlebar" '("ns-auto-titlebar-set-"))

;;; End of scraped data

(provide 'ns-auto-titlebar-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; ns-auto-titlebar-autoloads.el ends here
