;;; package --- summary
;;; commentary:
;;; code:
(setq browse-url-browser-function 'eww-browse-url)
(exec-path-from-shell-initialize)

(require 'flymake-php)
(require 'web-mode)
(add-hook 'web-mode-hook 'flymake-php-load)

;;加载flycheck
 (use-package flycheck
  :diminish flycheck-mode
  :hook (after-init . global-flycheck-mode)
 :custom
  (flycheck-php-executable "/path/to/php")
  )

(provide 'init-php)
;;; init-php.el ends here
