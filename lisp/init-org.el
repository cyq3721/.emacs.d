;;; ini-org.el --- Summary -*-lexical-binding:t-*-
;;; Commentary:
;;; code:

(use-package org
  :ensure nil  ; Org 是 Emacs 内置的
  :hook (org-mode . (lambda () (setq truncate-lines nil)))   ;;自动换行
  :after org
  :defer t
  :custom
  ;; 基本设置
  (org-directory "~/My_Note/note/")                    ; Org 文件目录
  (org-agenda-files '("~/My_Note/org"))              ; Agenda 文件
  (org-default-notes-file "~/My_Note/My_Notebook.org") ; 默认笔记文件
  
  ;; 显示设置
  (org-startup-indented t)                   ; 启用缩进
  (org-startup-folded 'content)              ; 启动时折叠状态
  (org-hide-emphasis-markers t)              ; 隐藏格式标记
  (org-pretty-entities t)                    ; 美化实体显示
  (org-ellipsis " ↴")                        ; 折叠符号

  
  ;; 编辑设置
  (org-special-ctrl-a/e t)                   ; 改进的行首/行尾导航
  (org-return-follows-link t)                ; RET 跟随链接
  (org-M-RET-may-split-line nil)             ; M-RET 不分行
  
  ;; 文件设置
  (org-export-backends '(ascii html icalendar latex md))

  ( org-src-fontify-natively t)      ;;org-mode引用代码时实现语法高亮
  ;; ( org-hide-leading-stars t)
  (add-to-list 'org-export-backends 'md)   ;;导出md格式
  ;; default options for all output formats
  ( org-pandoc-options '((standalone . t)))
  ;; cancel above settings only for 'docx' format
  ( org-pandoc-options-for-docx '((standalone . nil)))
  ;; special settings for beamer-pdf and latex-pdf exporters
  ( org-pandoc-options-for-beamer-pdf '((pdf-engine . "xelatex")))
  ( org-pandoc-options-for-latex-pdf '((pdf-engine . "pdflatex")))
  ;; special extensions for markdown_github output
  ( org-pandoc-format-extensions '(markdown_github+pipe_tables+raw_html))

  ; ====================
;; Org Agenda 配置
;; ====================

(setq org-agenda-custom-commands
      '(("n" "Agenda and all TODOs"
         ((agenda "" ((org-agenda-span 'day)))
          (alltodo "")))
        
        ("w" "Weekly agenda"
         ((agenda "" ((org-agenda-span 7))))
         ((org-agenda-start-day "+0d")))
        
        ("d" "Daily agenda"
         ((agenda "" ((org-agenda-span 'day))))
         ((org-agenda-start-day "+0d")))))

;; Agenda 显示设置
(setq org-agenda-start-with-log-mode t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-include-deadlines t)
(setq org-agenda-include-diary t)
(setq org-deadline-warning-days 7)  ; 提前7天警告

;; 日志设置
(setq org-log-done 'time)           ; 完成时记录时间
(setq org-log-into-drawer t)        ; 日志放在 LOGBOOK 抽屉中
(setq org-log-state-notes-into-drawer t)

;; ====================
;; TODO 系统配置
;; ====================

(setq org-todo-keywords
      '((sequence "TODO(t)" "PROG(p)" "|" "DONE(d)")
        (sequence "WAIT(w@/!)" "HOLD(h@/!)" "|" "CANC(c@/!)")))
        
(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weight bold)
        ("PROG" :foreground "orange" :weight bold)
        ("DONE" :foreground "forest green" :weight bold)
        ("WAIT" :foreground "magenta" :weight bold)
        ("HOLD" :foreground "yellow" :weight bold)
        ("CANC" :foreground "grey" :weight bold)))

;; 快速任务切换快捷键
(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; ====================
;; Org Capture 配置
;; ====================

(setq org-capture-templates
      `(("t" "Todo" entry (file+headline "~/My_Note/org/tasks.org" "Inbox")
         "* TODO %?\n  %i\n  %a")
        
        ("n" "Note" entry (file "~/My_Note/org/notes.org")
         "* %?\n  %U\n  %i\n  %a")
        
        ("j" "Journal" entry (file+datetree "~/My_Note/org/journal.org")
         "* %?\n  %U\n  %i")
        
        ("m" "Meeting" entry (file+headline "~/My_Note/org/meetings.org" "Meetings")
         "* %? :meeting:\n  %U\n  %i")
        
        ("e" "Email" entry (file+headline "~/My_Note/org/emails.org" "Emails")
         "* TODO Reply: %?\n  %U\n  %a")
        
        ("b" "Bookmark" entry (file+headline "~/My_Note/org/bookmarks.org" "Bookmarks")
         "* [[%:link][%:description]]\n  %U\n  #+BEGIN_QUOTE\n  %i\n  #+END_QUOTE")
        
        ("i" "Idea" entry (file+headline "~/My_Note/org/ideas.org" "Ideas")
         "* %?\n  %U\n  %i")))
;; ====================
;; Org Babel 配置
;; ====================

;; 启用语言支持
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (emacs-lisp . t)
   (shell . t)
   (sql . t)
   (javascript . t)
   (C . t)
   (R . t)
   (latex . t)
   (plantuml . t)
   (ditaa . t)
   (dot . t)))

;; 代码块头参数默认值
(setq org-babel-default-header-args
      '((:session . "none")
        (:results . "output")
        (:exports . "code")
        (:cache . "no")
        (:noweb . "no")
        (:hlines . "no")
        (:tangle . "no")
        (:padline . "yes")))

;; PlantUML 支持
(setq org-plantuml-jar-path (expand-file-name "~/plantuml.jar"))
(setq plantuml-jar-path org-plantuml-jar-path)

;; ====================
;; 表格配置
;; ====================

(setq org-table-auto-recalculate-regexp "^#\\+TBLFM:")
(setq org-table-use-standard-references t)
(setq org-table-export-default-format "orgtbl-to-csv")

;; 表格公式
(setq org-table-formula-evaluate-inline t)
(setq org-table-formula-use-constants t)
;; ====================
;; 链接和附件配置
;; ====================

(setq org-link-abbrev-alist
      '(("google" . "http://www.google.com/search?q=%s")
        ("wiki" . "http://en.wikipedia.org/wiki/%s")
        ("github" . "https://github.com/%s")))

;; 文件附件
(setq org-attach-id-dir "~/My_Note/org/attach/")
(setq org-attach-store-link-p 'attached)
(setq org-attach-auto-tag "ATTACH")

;; ====================
;; 导出配置
;; ====================

;; HTML 导出
(setq org-html-validation-link nil)
(setq org-html-head-include-default-style nil)
(setq org-html-head
      "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdn.jsdelivr.net/npm/water.css@2/out/water.css\" />")

;; LaTeX 导出
(setq org-latex-default-class "article")
(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))

;; Markdown 导出
(setq org-md-footnotes-section "")

;; 代码块导出样式
(setq org-html-htmlize-output-type 'css)

  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c b" . org-switchb))
  
  :config
  ;; 自动加载 org 目录
  (unless (file-exists-p org-directory)
    (make-directory org-directory t))
  ;;各级标题字体大小
 ; (org-document-title ((t (:height 1.5 :weight bold))))
 ;(set-face-attribute 'org-level-1 nil :height 1.6)  ; 1级标题，160%大小
 ;(set-face-attribute 'org-level-2 nil :height 1.4)  ; 2级标题，140%大小
; (set-face-attribute 'org-level-3 nil :height 1.2)  ; 3级标题，120%大小
; (set-face-attribute 'org-level-4 nil :height 1.1)  ; 4级标题，110%大小
  ;; 源代码块语法高亮
  (setq org-src-fontify-natively t)      ; 使用原模式语法高亮
  (setq org-src-tab-acts-natively t)     ; TAB 在原模式中工作
  (setq org-src-preserve-indentation t)  ; 保留源代码缩进
  ;;设置导出文件的目录
  (setq org-export-output-directory "~/My_Note/org_Exports/")
  
  )

;; ====================
;; Org-mode 外观配置
;; ====================

;; 安装 org-modern（现代化外观）
(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode)
  :custom
  (org-modern-star '("◉" "○" "✸" "✿" "☯" "✤" "♣" "✜" "◇" "⬟"))
  (org-modern-table-vertical 1)
  (org-modern-table-horizontal 0.1)
  (org-modern-hide-stars t))


(use-package ox-pandoc
  :ensure t
  :after org
  :custom
  ;; 设置 pandoc 导出的默认目录
  (setq org-pandoc-export-directory "~/My_Note/org_Exports/")
 :config
 
 ;; default options for all output formats
(setq org-pandoc-options '((standalone . t)))
;; cancel above settings only for 'docx' format
(setq org-pandoc-options-for-docx '((standalone . nil)))
;; special settings for beamer-pdf and latex-pdf exporters
(setq org-pandoc-options-for-beamer-pdf '((pdf-engine . "xelatex")))
(setq org-pandoc-options-for-latex-pdf '((pdf-engine . "pdflatex")))
;; special extensions for markdown_github output
(setq org-pandoc-format-extensions '(markdown_github+pipe_tables+raw_html))
;; 可选：设置默认 pandoc 参数
  (setq org-pandoc-options-for-html5 '(("--mathml")))
  ;; 注册到 Org 导出系统（关键！）
  (eval-after-load 'ox
    '(require 'ox-pandoc)))

  
 

(use-package pandoc-mode
  :ensure t
  :config
  (pandoc-mode t)
  (global-set-key (kbd "C-c p") 'pandoc-main-hydra))


;;(use-package org-bullets
 ;; :ensure t
;;  :hook (org-mode . org-bullets-mode)
 ;; :config (setq org-bullets-bullet-list '( "◉" "○" "✸" "✿" "☯" "☢" "✜" "♠" "♣" "♦")))



;;-------不关闭中文输入法输入*和-------
(defun org-mode-my-init ()
  ; ......
  (define-key org-mode-map (kbd "×") (kbd "*"))
  (define-key org-mode-map (kbd "－") (kbd "-"))
  )

(add-hook 'org-mode-hook 'org-mode-my-init)

;; ====================
;; 进阶功能
;; ====================

;; 安装 org-roam（知识管理）

;; 安装 org-superstar（更好的标题图标）
(use-package org-superstar
  :ensure t
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-leading-bullet ?\s)
  (org-superstar-special-todo-items t))

;; 安装 org-download（拖拽图片）
(use-package org-download
  :ensure t
  :after org
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-screenshot)
         ("s-y" . org-download-yank)))
  :custom
  (org-download-method 'directory)
  (org-download-image-dir "./My_Note/org/images")
  (org-download-heading-lvl nil))

;; 安装 org-pomodoro（番茄工作法）
;(use-package org-pomodoro
 ; :ensure t
 ; :bind ("C-c p" . org-pomodoro))

(provide 'init-org)
;;; init-org.el ends here
