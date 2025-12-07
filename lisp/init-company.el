;;; init-comany.el --- 配置company补全 -*- lexical-binding: t -*-
;;; commentary:
;;; code:

;; 自动补全
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-dabbrev-other-buffers t)
  (setq company-dabbrev-code-modes t)
  (setq company-transformers '(company-sort-by-occurrence))
  :bind
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("<tab>" . company-complete-selection)))

;; PHP 专用补全
(use-package company-php
  :after company
  :config
  (add-to-list 'company-backends 'company-ac-php-backend))

;; Web 开发补全
(use-package company-web
  :after company
  :config
  (add-to-list 'company-backends 'company-web-html)
  (add-to-list 'company-backends 'company-css))

;; 代码导航
(use-package dumb-jump
  :bind
  (("M-g o" . dumb-jump-go-other-window)
   ("M-g j" . dumb-jump-go)
   ("M-g i" . dumb-jump-go-prompt)
   ("M-g x" . dumb-jump-go-prefer-external)
   ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-selector 'ivy))

;; 大纲视图
(use-package imenu-list
  :bind ("C-," . imenu-list-smart-toggle)
  :config
  (setq imenu-list-focus-after-activation t)
  (setq imenu-list-auto-resize t))

;; 代码折叠
(use-package origami
  :hook (prog-mode . origami-mode)
  :bind
  ("C-c f" . origami-toggle-node)
  ("C-c F" . origami-toggle-all-nodes))


(provide 'init-company)
;;; init-company.el ends here
