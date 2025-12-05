;;; init-php.el --- configuration fil-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package php-mode
  :mode ("\\.php\\'" "\\.php\\'" "\\.phtml\\'" "\\.blade\\'")
  :config
  (setq php-mode-coding-style 'psr2)
  (setq php-mode-async-query t)
  (setq php-template-compatibility nil)
  (setq php-manual-path "/usr/share/doc/php/manual")
    ;; Laravel 特定的配置
  (add-hook 'php-mode-hook 'laravel-setup)
  :hook
  (php-mode . (lambda ()
               (setq-local company-backends
                           '(company-acphp-backend company-dabbrev-code))
               (yas-activate-extra-mode 'php-mode)
               (flycheck-mode))))
(use-package web-mode
  :ensure t)
(defun laravel-setup ()
 ;; "为 Laravel 项目设置 PHP 模式"
  (when (laravel-project-p)
    ;; 设置项目根目录
    (setq-local projectile-project-root (laravel-find-root))
    
    ;; Laravel 特定缩进
    (setq-local php-mode-coding-style 'laravel)
    
    ;; Blade 模板支持
    (web-mode-on-engine "blade")
    
    ;; 启用 Laravel 辅助功能
    (laravel-enable-features)))

(defun laravel-project-p ()
  "检查当前是否是 Laravel 项目"
  (let ((root (locate-dominating-file default-directory "artisan")))
    (and root t)))

(defun laravel-find-root ()
 ;; "找到 Laravel 项目根目录"
(locate-dominating-file default-directory "artisan"))



;; PHP 重构工具
(use-package php-refactor-mode
  :hook (php-mode . php-refactor-mode)
  :bind
  (:map php-refactor-mode-map
        ("C-c r e" . php-refactor-extract-method)
        ("C-c r v" . php-refactor-extract-variable)
        ("C-c r i" . php-refactor-inline-variable)))

;; PHP 单元测试
(use-package phpunit
  :commands (phpunit-current-test phpunit-current-class phpunit-current-project)
  :config
  (setq phpunit-configuration-file "phpunit.xml")
  (setq phpunit-root ".")
  :bind
  ("C-c t t" . phpunit-current-test)
  ("C-c t c" . phpunit-current-class)
  ("C-c t p" . phpunit-current-project))

(use-package phpstan
  :ensure t
  )

(defun my-php-mode-setup ()
  "My PHP-mode hook."
  (require 'flycheck-phpstan)
  (flycheck-mode t))

(add-hook 'php-mode-hook 'my-php-mode-setup)

;; PHP 代码质量
(use-package flycheck-phpstan
  :after flycheck
  :config
 ; (flycheck-phpstan-turn-on))
)



(provide 'init-php)
;;; init-php.el ends here
