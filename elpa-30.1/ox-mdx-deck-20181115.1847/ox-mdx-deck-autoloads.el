;;; ox-mdx-deck-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from ox-mdx-deck.el

(org-export-define-derived-backend 'mdx-deck 'blackfriday :menu-entry '(120 "MDX Deck" ((102 "File" ox-mdx-deck--export-to-file) (98 "Buffer" ox-mdx-deck--export-to-buffer))) :options-alist '((:with-toc) (:with-special-strings)) :translate-alist '((headline lambda (headline contents info) (concat (org-md-headline headline contents info) "---")) (src-block lambda (src-block contents info) (if (string-equal "rjsx" (org-element-property :language src-block)) (org-element-property :value src-block) (org-blackfriday-src-block src-block contents info)))))
(register-definition-prefixes "ox-mdx-deck" '("ox-mdx-deck--export-to-"))


;;; End of scraped data

(provide 'ox-mdx-deck-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; ox-mdx-deck-autoloads.el ends here
