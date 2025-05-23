;;; whole-line-or-region-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from whole-line-or-region.el

(autoload 'whole-line-or-region-local-mode "whole-line-or-region" "\
Make chosen commands operate on the current line if no region is active.

Modify `whole-line-or-region-local-mode-map' to change which
commands are affected.

This is a minor mode.  If called interactively, toggle the
`Whole-Line-Or-Region-Local mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable the
mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable the
mode if ARG is nil, omitted, or is a positive number.  Disable the mode
if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate the variable `whole-line-or-region-local-mode'.

The mode's hook is called both when the mode is enabled and when it is
disabled.

(fn &optional ARG)" t)
(put 'whole-line-or-region-global-mode 'globalized-minor-mode t)
(defvar whole-line-or-region-global-mode nil "\
Non-nil if Whole-Line-Or-Region-Global mode is enabled.
See the `whole-line-or-region-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `whole-line-or-region-global-mode'.")
(custom-autoload 'whole-line-or-region-global-mode "whole-line-or-region" nil)
(autoload 'whole-line-or-region-global-mode "whole-line-or-region" "\
Toggle Whole-Line-Or-Region-Local mode in all buffers.
With prefix ARG, enable Whole-Line-Or-Region-Global mode if ARG is
positive; otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Whole-Line-Or-Region-Local mode is enabled in all buffers where
`(lambda nil (unless (apply 'derived-mode-p
whole-line-or-region-inhibit-modes) (whole-line-or-region-local-mode
1)))' would do it.

See `whole-line-or-region-local-mode' for more information on
Whole-Line-Or-Region-Local mode.

(fn &optional ARG)" t)
(autoload 'whole-line-or-region-copy-region-as-kill "whole-line-or-region" "\
Call `copy-region-as-kill' on region or PREFIX whole lines.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-kill-region "whole-line-or-region" "\
Call `kill-region' on region or PREFIX whole lines.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-kill-ring-save "whole-line-or-region" "\
Call `kill-ring-save' on region or PREFIX whole lines.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-delete-region "whole-line-or-region" "\
Call `delete-region' on region or PREFIX whole lines.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-comment-region "whole-line-or-region" "\
Call `comment-region' on region or PREFIX whole lines.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-comment-dwim "whole-line-or-region" "\
Call `comment-dwim' on region or current line.
PREFIX is passed unchanged to `comment-dwim'.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-comment-dwim-2 "whole-line-or-region" "\
Call `comment-dwim' on region or PREFIX whole line.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-uncomment-region "whole-line-or-region" "\
Call `uncomment-region' on region or PREFIX whole lines.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-comment-or-uncomment-region "whole-line-or-region" "\
Call `comment-or-uncomment-region' on region or PREFIX whole lines.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-indent-rigidly-left-to-tab-stop "whole-line-or-region" "\
Call `indent-rigidly-left-to-tab-stop' on region or PREFIX whole lines.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-indent-rigidly-right-to-tab-stop "whole-line-or-region" "\
Call `indent-rigidly-right-to-tab-stop' on region or PREFIX whole lines.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-indent-rigidly-left "whole-line-or-region" "\
Call `indent-rigidly-left-to-tab-stop' on region or PREFIX whole lines.

(fn PREFIX)" t)
(autoload 'whole-line-or-region-indent-rigidly-right "whole-line-or-region" "\
Call `indent-rigidly-right-to-tab-stop' on region or PREFIX whole lines.

(fn PREFIX)" t)
(register-definition-prefixes "whole-line-or-region" '("whole-line-or-region-"))

;;; End of scraped data

(provide 'whole-line-or-region-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; whole-line-or-region-autoloads.el ends here
