;;; ini-better-default --- -*-lexical-binding:t -*-
;;; commentary:
;;; code:

(use-package hungry-delete
  :ensure t
  :config (global-hungry-delete-mode))


;;把这些缺省禁用的功能打开。
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
;;--------------------
;;让 dired 可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; 缩进配置
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; 自动配对括号
(electric-pair-mode 1)

(global-font-lock-mode t)        ;;进行语法加
(delete-selection-mode 1)        ;;删除和替换选中部分

(global-display-line-numbers-mode 1)  ;;全局开启行号
(setq display-line-numbers-type 'relative)
;; 显示列号
(column-number-mode 1)

(electric-indent-mode t)           ;;回车后自动缩进
(setq ring-bell-function 'ignore)      ;; Turn off sound alarms completely
(fset 'yes-or-no-p 'y-or-n-p)
;;(setq kill-ring-max 200)   ;;目前废弃
;;(setq default-fill-column 60)  ;;把 fill-column 设为 60. 这样的文字更好读
(mouse-avoidance-mode 'animate)  ;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
(setq frame-title-format "emacs@%b")   ;;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用 的提示

(auto-image-file-mode t)  ;;让 Emacs 可以直接打开和显示图片。

(setq show-paren-style 'parentheses)    ;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号


;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插 入两个空格
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;--------------------

;;(setq enable-recursive-minibuffers t)   ;;可以递归的使用 minibuffer


;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文
(setq scroll-margin 3
      scroll-conservatively 10000) 

;打开最近文件，设置快捷键 c-x c-r
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 30)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;快速打开配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

;;--------------------
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 安装所有字体
(use-package all-the-icons
  :if (display-graphic-p))

;; 主题配置
(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; 模型行美化
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 25
        doom-modeline-bar-width 3
        doom-modeline-minor-modes t
        doom-modeline-buffer-file-name-style 'relative-from-project))

;; 彩虹分隔符
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
;; 文件树
(use-package neotree
  :ensure t
  :bind (("C-c o" . neotree-toggle))
  :config
  (setq neo-theme 'icons
        neo-window-width 30))

;; 代码折叠
(use-package hideshow
  :hook (prog-mode . hs-minor-mode)
  :bind
  ("C-c h" . hs-hide-block)
  ("C-c s" . hs-show-block)
  ("C-c H" . hs-hide-all)
  ("C-c S" . hs-show-all))

;; 多光标编辑
(use-package multiple-cursors
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))

;; 代码片段
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (use-package yasnippet-snippets))

(use-package yasnippet-capf
  :after yasnippet
  :config
  (add-to-list 'completion-at-point-functions #'yasnippet-capf))


(provide 'init-better-default)
;;; init-better-default.el ends here
