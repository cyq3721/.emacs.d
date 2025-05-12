;;; my-emacs.el --- 临时配置，用于调试不确定的配置代码
;;; Commentary:

;;; Code:
(global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选
(global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
(global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
(global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
(global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrol-z 撤销
(global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrol-x 剪切


;;加载all-the-icons
(use-package all-the-icons
                 :ensure t
                 :if (display-graphic-p)
                 :config
                 (insert (all-the-icons-icon-for-file "foo.js"))
                 (set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'append)
                 (set-fontset-font t 'unicode (font-spec :family "file-icons") nil 'append)
                 (set-fontset-font t 'unicode (font-spec :family "Material Icons") nil 'append)
                 (set-fontset-font t 'unicode (font-spec :family "github-octicons") nil 'append)
                 (set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'append)
                 (set-fontset-font t 'unicode (font-spec :family "Weather Icons") nil 'append)
                

                    )

(use-package all-the-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(load "all-the-icons-dired.el")
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(provide 'init-my-emacs)
;;; init.el ends here
