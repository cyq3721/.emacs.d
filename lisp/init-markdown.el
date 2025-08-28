;;; Commentary:
;;; Code:
(require-package 'markdown-mode)
;;(require-package 'gfm-mode)

(use-package markdown-mode
  :ensure t
;;  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-do)))

(provide 'init-markdown)
;;; init-markdown.el ends here
