;;; package --- Summary
;;; Commentary:
;;; code:
(require-package 'company)
;;(require 'flycheck )
;;(global-flycheck-mode t)
(require-package 'yasnippet)
(require-package 'web-mode)
(require 'web-mode)
(require-package 'company-web)
(require 'company-web-html)
(require 'company-web-jade)
(require 'company-web-slim)

(require-package 'ac-html-csswatcher)
(require-package 'ac-html-bootstrap)
(require-package 'company-statistics)

;; you may key bind, for example for web-mode:
;(define-key web-mode-map (kbd "C-'") 'company-web-html)


;(company-quickhelp-mode 1)

(add-hook 'after-init-hook 'global-company-mode)  ;;开启补全

(eval-after-load 'company
   '(define-key company-active-map (kbd "C-c h") 'company-quickhelp-manual-begin))

(yas-global-mode 1)

(setq company-dabbrev-code-everywhere 't
        company-dabbrev-code-modes 't
        company-dabbrev-code-other-buffers 'all
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case 't
        company-dabbrev-other-buffers 'all
        company-require-match nil
        company-minimum-prefix-length 2
        company-show-numbers 't
        company-tooltip-limit 20
        company-idle-delay 0
        company-echo-delay 0
        company-tooltip-offset-display 'scrollbar
        company-begin-commands '(self-insert-command))
(push '(company-semantic :with company-yasnippet) company-backends)


(add-hook 'web-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-web-html))
                          (company-mode t)))

;;颜色设置
(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))


;;在web-mode中开启company支持
(defun my-web-mode-hook ()
  "Hook for `web-mode'."
    (set (make-local-variable 'company-backends)
         '(company-tern company-web-html company-yasnippet company-files)))

(add-hook 'web-mode-hook 'my-web-mode-hook)

;; Enable JavaScript completion between <script>...</script> etc.
(advice-add 'company-tern :before
            #'(lambda (&rest _)
                (if (equal major-mode 'web-mode)
                    (let ((web-mode-cur-language
                          (web-mode-language-at-pos)))
                      (if (or (string= web-mode-cur-language "javascript")
                              (string= web-mode-cur-language "jsx"))
                          (unless tern-mode (tern-mode))
                        (if tern-mode (tern-mode -1)))))))

;; manual autocomplete
(define-key web-mode-map (kbd "M-SPC") 'company-complete)

(provide 'init-company)
;;; init-company.el ends here
