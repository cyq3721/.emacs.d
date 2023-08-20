;;; package --- summary
;;; commentary:
;;; code:

(require 'org)
(setq org-src-fontify-natively t)      ;;org-mode引用代码时实现语法高亮
(add-hook 'org-mode-hook   
	  (lambda () (setq truncate-lines nil)))  ;;自动换行
(setq org-agenda-files '("/org"))
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-startup-indented t)  ;;开启自动缩进

(setq org-hide-leading-stars t)

;; 导出 md 格式
(with-eval-after-load 'org
  (add-to-list 'org-export-backends 'md))

;;-------不关闭中文输入法输入*和-------
(defun org-mode-my-init ()
  ; ......
  (define-key org-mode-map (kbd "×") (kbd "*"))
  (define-key org-mode-map (kbd "－") (kbd "-"))
  )

(add-hook 'org-mode-hook 'org-mode-my-init)
;;--------------------


;;设置org-capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file  "~/my_note(emacs版)/org/inbox.org")


;;修改标记符号
(require 'org-bullets)
(add-hook 'org-mode-hook #'org-bullets-mode)
(setq org-bullets-bullet-list '( "◉" "○" "✸" "✿" "☯" "✜"))
;;♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶

;;导出站点
(require 'ox-publish)
(setq org-publish-project-alist
;notes组件
  '((
	 "org-notes"
	 :base-directory "~/my_note(emacs版)/note/" ;设置存放.org文件位置 
	 :base-extension "org" ;仅处理 .org 格式文件
	 :publishing-directory "~/my_note(emacs版)/public_html/" ;导出html文件位置
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4 ;Just the default for this project.
	 :auto-preamble t
	 :auto-sitemap t                  ;自动生成 sitemap.org
	 :sitemap-filename "sitemap.org"  ;默认名称
	 :sitemap-title "Sitemap"         
	 :export-creator-info nil    ;禁止在 postamble 显示"Created by Org"
	 :export-author-info nil     ;禁止在 postamble 显示 "Author: Your Name"
	 :auto-postamble nil         
	 :table-of-contents t      ;禁止生成文章目录，如果要生成，将 nil 改为 t
	 :section-numbers t       ;禁止在段落标题前使用数字，如果使用，将 nil 改为 t
	 :html-postamble "<p class=\"postamble\">Update time: %d.</p> " ;自定义 postamble 显示字样
	  :style-include-default nil  ;禁用默认 css 样式,使用自定义css
	  :style "<link rel='stylesheet' type='text/css' href='css/org.css' />"
	)
;;static 组件
	("org-static"
	 :base-directory "~/my_note(emacs版)/note/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/my_note(emacs版)/public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
;;publish 组件
	("org" :components ("org-notes" "org-static"))
))
(provide 'init-org)
;;; init-org.el ends here
