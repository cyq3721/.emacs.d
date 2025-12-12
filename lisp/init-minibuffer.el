;;; init-minibuffer.el  --- 配置minibuffer
;;; commentary:
;;; code:

(use-package which-key
  :ensure t
  :config (which-key-mode t))

(use-package vertico
  :ensure t
  :config (vertico-mode t))

(use-package orderless
  :ensure t
  :config (setq completion-styles '(orderless)))

(use-package marginalia
  :ensure t
  :config (marginalia-mode t))

(use-package embark
  :ensure t
  :config (setq prefix-help-command 'embark-prefix-help-command)
  :bind ("C-;" . embark-act))

(use-package keycast
  :ensure t
  :hook (after-init . keycast-mode)
  :custom (keycast-mode-line-format '(" [" keycast--kbd " ⇢ " keycast--cmd " ]"))
  :config
  ((setq keycast-mode-line-remove-tail-elements nil)
  ;; 或者使用 header-line 显示
  (keycast-table-bar-mode 1))
 

;;------------显示时间设置------------------------------

;(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
;(setq display-time-24hr-format t);;时间使用24小时制
;(setq display-time-day-and-date t);;时间显示包括日期和具体时间
;;(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
;(setq display-time-interval 10);;时间的变化频率，单位多少来着？

(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
