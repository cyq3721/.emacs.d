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
(use-package flycheck-phpstan
  :after flycheck
  :config
  ;(flycheck-phpstan-setup)
  )

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
  :hook ( web-mode . web-beautify)
  :bind
  ("C-c b h" . web-beautify-html)
  ("C-c b c" . web-beautify-css)
  ("C-c b j" . web-beautify-js)
  ("C-c b s" . web-beautify-html))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
