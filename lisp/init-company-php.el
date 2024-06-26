;;; init-company-php  --- php补全
;;; commentary:
;;; code:
(require 'php-mode)
(require 'web-mode)
(add-hook 'web-mode-hook
          '(lambda ()
             ;; Enable company-mode
             (company-mode t)
             
             (require 'company-php)
             (require 'ac-php)
             (setq ac-sources '(ac-source-php))

             ;; As an example (optional)
             (yas-global-mode 1)


             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev-code)
                    company-capf company-files))

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))

(add-hook 'web-mode-hook '(company-mode t))

(provide 'init-company-php)
;;; init-company-php.el ends here
