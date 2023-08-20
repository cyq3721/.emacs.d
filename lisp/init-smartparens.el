;;; package --- summary
;;; commentary:
;;; code:

(require 'smartparens-config)
(smartparens-global-mode 1)

(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)  ;;在lisp模式中'不补全

;;(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

;; 光标 在括号内时就高亮包含内容的两个括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


(provide 'init-smartparens)
;;; init-smartparens.el ends here
