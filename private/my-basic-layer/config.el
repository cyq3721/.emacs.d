;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

(menu-bar-mode 1)

;;让 dired 可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;;删除和替换选中部分
(delete-selection-mode 1)

;;全局开启行号
(global-linum-mode t)

;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
(mouse-avoidance-mode 'animate)

;;让 Emacs 可以直接打开和显示图片。
(auto-image-file-mode t)

;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号
(setq show-paren-style 'parentheses)

;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插 入两个空格
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;----------------------------------------------
;打开最近文件，设置快捷键 c-x c-r
;;(require '~/.emacs.d/.cache/recentf)
;;(recentf-mode 1)
;;(setq recentf-max-menu-items 30)

;;----------------------------------------------
;;------------显示时间设置------------------------------

(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
;;(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
(setq display-time-interval 10);;时间的变化频率，单位多少来着？
