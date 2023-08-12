;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'popwin)
(require 'hungry-delete )    ;;hungry-delete 一次性删除相同字符
(require 'dired-x)

(popwin-mode 1)                        ;;将光标自动移动到新打开的窗口

;;加载image+
(eval-after-load 'image '(require 'image+))


;;(tool-bar-mode -1)                     ;;关闭工具栏
(which-key-mode t)                    ;;打开which-key-mode
;;(scroll-bar-mode -1)                  ;;关闭滚动条

(setq track-eol t)  ;; 当光标在行尾上下移动的时候，始终保持在行尾。
;;(setq linum-format "%4d \u2502 ")  ;; format line number spacing
;;--------------------
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


(global-hl-line-mode t)             ;;高亮当前行
(global-font-lock-mode t)        ;;进行语法加亮
(delete-selection-mode 1)           ;;删除和替换选中部分
;;(global-linum-mode t)                ;;全局开启行号
(electric-indent-mode t)             ;;回车自动缩进
(delete-selection-mode t)            ;;开启选中替换，选中删除
(global-hungry-delete-mode t)
(global-auto-revert-mode t)      ;;自动加载外部修改过的文件
;;(smex t)

(setq-default cursor-type 'bar)        ;;修改光标形状
;;(setq inhibit-splash-screen t)           ;;关闭启动画面
(setq make-backup-files nil)            ;;关闭自动备份
(setq auto-save-default nil)             ;;关闭文件的自动保存
(setq ring-bell-function 'ignore)      ;; Turn off sound alarms completely
(fset 'yes-or-no-p 'y-or-n-p)

(setq kill-ring-max 200)       ;;设置一个大的kill-ring
(setq mouse-yank-at-point t)   ;;鼠标 中键一点击，X selection 的内容就被插入到那个位置
;;(setq default-fill-column 60)  ;;把 fill-column 设为 60. 这样的文字更好读
(mouse-avoidance-mode 'animate)  ;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
(setq frame-title-format "emacs@%b")   ;;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用 的提示

(auto-image-file-mode t)  ;;让 Emacs 可以直接打开和显示图片。




;(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)    ;;开启括号补齐
;;(show-paren-mode t)
;;(setq show-paren-style 'parentheses)    ;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号

;;--------------------
;;不用 TAB 字符来indent, 这会引起很多奇怪的错误。
;;编辑 Makefile 的时候也不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的
;;(setq-default indent-tabs-mode nil)
;;(setq default-tab-width 8)
;;(setq tab-stop-list ())
;;(loop for x downfrom 40 to 1 do
  ;;    (setq tab-stop-list (cons (* x 4) tab-stop-list)))  
;;--------------------

;;(setq-default auto-fill-function 'do-auto-fill)  ;;Autofill in all modes;;
;;(setq default-fill-column 60)    ;;把 fill-column 设为 60. 这样的文字更好读
;;--------------------

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
  (find-file "~/emacs配置文件/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

;;--------------------
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)




;;自动缩进
(defun indent-buffer()
  "Indent the currently visited buffer."
  (interactive)
  
  (indent-region (point-min) (point-max))
  )

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion)
  (if (region-active-p)
      (progn
	(indent-region (region-geginning) (region-end))
	(message "Endented selected region."))
    (progn
      (indent-buffer)
      (message "Indented buffer.")))
  )

(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers  
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(fset 'yes-or-no-p 'y-or-n-p)
;;总是允许递归删除
(setq dired-recursive-deletes 'always)


;;------------显示时间设置------------------------------

(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
;;(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
(setq display-time-interval 10);;时间的变化频率，单位多少来着？

;;------------显示时间设置结束--------------

;;打开多个dired时，共用一个buffer
(put 'dired-find-alternate-file 'disabled nil)
;;(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)


(setq dired-dwim-target t)     ;;开启两个窗口复制文件时，自动复制到另一个窗口


;;去除dos换行符
(defun hidden-dos-eol ()
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;;使用session.el
(require 'session)
(add-hook 'after-init-hook 'session-initialize)
;;使用desktop.el
;;(load "desktop")
;;(desktop-load-default)
;;(desktop-read)
;;使用ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

(provide 'init-better-default)
;;; init-better-default.el ends here
