;;; package --- Summary
;;; Commentary:
;;; code:
(require 'company)
;;(require 'flycheck )
;;(global-flycheck-mode t)
(require 'yasnippet)
(company-quickhelp-mode)

(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load 'company
   '(define-key company-active-map (kbd "C-c h") 'company-quickhelp-manual-begin))

(yas-global-mode 1)
(add-hook 'after-init-hook 'global-company-mode)          ;;开启补全
(setq company-dabbrev-code-everywhere t
        company-dabbrev-code-modes t
        company-dabbrev-code-other-buffers 'all
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t
        company-dabbrev-other-buffers 'all
        company-require-match nil
        company-minimum-prefix-length 1
        company-show-numbers t
        company-tooltip-limit 20
        company-idle-delay 0
        company-echo-delay 0
        company-tooltip-offset-display 'scrollbar
        company-begin-commands '(self-insert-command))
(push '(company-semantic :with company-yasnippet) company-backends)


(provide 'init-company)
;;; init-company.el ends here
