;;; init-packages --- 配置文件init.el-*- lexical-binding: t -*-
;;; commentary:
;;; code:
(require 'package)
(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")

                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;; 如果 use-package 未安装则安装
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 配置 use-package
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; 自动安装缺失的包
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; 文件末尾
(provide 'init-packages)
;;; init-packages.el ends here
