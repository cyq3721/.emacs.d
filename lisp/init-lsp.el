;;; init.el --- summary -*- lexical-binding: t -*-
;;; commentary:
;;; code:

(use-package lsp-mode
  :ensure t
  :init
 ; (setq lsp-keymap-prefix "C-c l")
  ;(setq lsp-completion-provider :capf)
  ;; 自动安装语言服务器
  (setq lsp-auto-configure t)
  (setq lsp-auto-guess-root t)
;  (setq lsp-restart 'auto-restart)

  :hook (
         ;; if you want which-key integration
        ; (lsp-mode . lsp-enable-which-key-integration)
         ;; 自动为支持的语言启用 LSP
         (python-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (c++-mode . lsp-deferred)
	 (rust-mode . lsp-deferred)
         (java-mode . lsp-deferred)
         (web-mode . lsp-deferred)
         (css-mode . lsp-deferred)
         (html-mode . lsp-deferred)
	;; 或者使用 prog-mode 为所有编程模式启用
       ; (prog-mode . lsp)
	 )
  :commands (lsp lsp-deferred)
 
  )





(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/projects/" "~/work/" "~/playground"))
  :config
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (global-set-key (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))





(setq lsp-disabled-clients '(semgrep-ls))
(provide 'init-lsp)
;;; init-lsp.el ends here
