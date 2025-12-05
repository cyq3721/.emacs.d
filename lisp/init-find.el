;;; ini-find.el --- 增强搜索补全-*- lexical-binding: t -*-
;;; commentary:
;;; code:

;;配置ivy
(use-package ivy
  :ensure t
  :diminish

  :bind (("C-s" . swiper)
         ("C-c C-r" . ivy-resume)
         ("C-c C-b" . ivy-switch-buffer)
         :map ivy-minibuffer-map
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-alt-done)
         ("C-h" . ivy-backward-delete-char))
  :custom
  (ivy-use-virtual-buffers t)      ; 显示最近打开的文件
  (ivy-count-format "(%d/%d) ")    ; 显示项目计数
  (ivy-height 15)                  ; 最小缓冲区高度
  (ivy-truncate-lines t)           ; 不换行
  (ivy-initial-inputs-alist nil)   ; 不预先输入 ^
  (ivy-re-builders-alist           ; 不同的正则表达式构建器
   '((t . ivy--regex-fuzzy)))
  (ivy-use-selectable-prompt t)    ; 可选择的提示
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure t
  :after ivy
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x b" . counsel-switch-buffer)
         ("C-x C-r" . counsel-recentf)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-git-grep)
         ("C-c k" . counsel-ag)
         ("C-c r" . counsel-rg))
  :custom
  (counsel-find-file-ignore-regexp "\\(?:^[#.]\\)\\|\\(?:[#~]$\\)\\|\\(?:^Icon?\\)")
  :config
  (counsel-mode 1))
 

(use-package amx
  :ensure t
  :config (amx-mode 1))

(use-package ace-window
  :ensure t
  :bind ("C-x o" . 'ace-window))



(provide 'init-find)
;;; init-find.el ends here
