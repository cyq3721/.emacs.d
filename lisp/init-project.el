;;; init-project.el --- configuration fil-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; ==================== 项目管理 ====================
;; Projectile 项目管理
(use-package projectile
  :init
  (projectile-mode +1)
  :config
  (setq projectile-project-search-path '("~/Projects/" "~/www/"))
  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-completion-system 'ivy)
  :bind
  ("C-c p" . projectile-command-map))

;; Treemacs 文件浏览器
(use-package treemacs
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t)
  :bind
  ("M-0" . treemacs-select-window)
  ("C-x t t" . treemacs)
  ("C-x t d" . treemacs-select-directory))

(use-package treemacs-projectile
  :after (treemacs projectile))

;; Magit Git 集成
(use-package magit
  :bind
  ("C-x g" . magit-status)
  :config
  (setq magit-diff-refine-hunk t)
  (setq magit-save-repository-buffers 'dontask))

;; Git 时间线
(use-package git-timemachine
  :bind
  ("C-c g t" . git-timemachine-toggle))

;; 版本控制注释
(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(provide 'init-project)
;;; init-project.el ends here
