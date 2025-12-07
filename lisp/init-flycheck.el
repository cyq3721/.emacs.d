;;; init-flycheck.el --- 配置company补全 -*- lexical-binding: t -*-
;;; commentary:
;;; code:
;; ==================== 语法检查 ====================
;; Flycheck 语法检查
(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (setq flycheck-idle-change-delay 1.0)
  (setq flycheck-display-errors-delay 0.1)
;  :bind
 ; ("C-c n" . flycheck-next-error)
;  ("C-c p" . flycheck-previous-error))
)
;; PHP 语法检查器
;(use-package flycheck-phpstan
 ; :after flycheck
  :config
  ;(flycheck-phpstan-setup)
  ;)

;; HTML 验证
;(use-package flycheck-html-validator
;  :after flycheck)

;; CSS 验证
(use-package flycheck-css-colorguard
  :after flycheck)

;; ==================== 代码格式化 ====================
;; Prettier 格式化
(use-package prettier-js
  :hook ((js-mode js-jsx-mode web-mode css-mode) . prettier-js-mode)
  :config
  (setq prettier-js-args '("--single-quote" "--trailing-comma" "all")))

;; PHP 格式化
(use-package php-cs-fixer
  :hook (php-mode . (lambda ()
                     (add-hook 'before-save-hook 'php-cs-fixer-before-save nil t)))
  :config
  (setq php-cs-fixer-command "php-cs-fixer")
  (setq php-cs-fixer-config-option "psr2"))

;; Web Beautify
(use-package web-beautify
  :ensure t
  :after (web-mode js2-mode)
  
  :init
  ;; 更详细的配置
  (setq web-beautify-html-indent-size 2
        web-beautify-css-indent-size 2
        web-beautify-js-indent-size 2
        ;; HTML 特定设置
        web-beautify-html-end-with-newline t
        web-beautify-html-max-preserve-newlines 2
        web-beautify-html-indent-inner-html t
        web-beautify-html-wrap-line-length 120
        ;; CSS 特定设置
        web-beautify-css-end-with-newline t
        web-beautify-css-selector-separator-newline t
        web-beautify-css-newline-between-rules t)
  
  :config
  ;; 自动检测文件类型并调用相应格式化函数
  (defun my-web-beautify-buffer-smart ()
    "智能格式化当前缓冲区"
    (interactive)
    (cond
     ((derived-mode-p 'web-mode)
      (let ((content-type (web-mode-content-type)))
        (cond
         ((string= content-type "html") (web-beautify-html-buffer))
         ((string= content-type "css") (web-beautify-css-buffer))
         ((string= content-type "javascript") (web-beautify-js-buffer))
         (t (web-beautify-html-buffer)))))
     ((derived-mode-p 'html-mode) (web-beautify-html-buffer))
     ((derived-mode-p 'css-mode) (web-beautify-css-buffer))
     ((derived-mode-p 'js-mode 'js2-mode 'javascript-mode) 
      (web-beautify-js-buffer))
     (t (message "当前模式不支持自动格式化"))))
  
  ;; 设置保存时自动格式化（可选）
  (defun my-web-beautify-before-save ()
    "保存前自动格式化"
    (when (and (boundp 'web-beautify-auto-format-on-save)
               web-beautify-auto-format-on-save)
      (my-web-beautify-buffer-smart)))
  
  (add-hook 'before-save-hook 'my-web-beautify-before-save))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
