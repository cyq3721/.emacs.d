;;; init-html.el --- Editing HTML -*- lexical-binding: t -*-
;;; Commentary:

;; ERB is configured separately in init-ruby

;;; Code:



(require-package 'web-mode)
(require-package 'emmet-mode)
(require-package 'php-mode)


(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.api\\'" . web-mode))
(add-to-list 'auto-mode-alist '("/some/react/path/.*\\.js[x]?\\'" . web-mode))




(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("php"    . "\\.tpl\\.php\\'")
        ("django" . "\\.html\\.twig\\'")
        ("blade"  . "\\.blade\\."))
      )


(setq web-mode-content-types-alist
  '(("json" . "/some/path/.*\\.api\\'")
    ("xml"  . "/other/path/.*\\.api\\'")
    ("jsx"  . "/some/react/path/.*\\.js[x]?\\'")))
;;--------------------------------------------------
(defun my-web-mode-hook ()      ;;建立函数（在web-mode下运行的函数）
  "Hooks for Web mode."
 ;; make these variables local
  (make-local-variable 'web-mode-code-indent-offset)
  (make-local-variable 'web-mode-markup-indent-offset)
  (make-local-variable 'web-mode-css-indent-offset)
  
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-css-indent-offset 2)

  (setq web-mode-ac-sources-alist
      '(("css" . (ac-source-words-in-buffer ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))
        ("php" . (ac-source-words-in-buffer
                  ac-source-words-in-same-mode-buffers
                  ac-source-dictionary))))
 
  (set (make-local-variable 'company-backends) '(company-css company-web-html company-yasnippet company-files))
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
(add-hook 'web-mode-hook  'emmet-mode)
;(add-hook 'web-mode-before-auto-complete-hooks
 ;   '(lambda ()
  ;   (let ((web-mode-cur-language
  ;	    (web-mode-language-at-pos)))
   ;            (if (string= web-mode-cur-language "php")
    ;	   (yas-activate-extra-mode 'php-mode)
     ; 	 (yas-deactivate-extra-mode 'php-mode))
      ;         (if (string= web-mode-cur-language "css")
    ;	   (setq emmet-use-css-transform t)
     ; 	 (setq emmet-use-css-transform nil)))))
;;--------------------------------------------------
(setq web-mode-css-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq web-mode-comment-style 2)


;;(set-face-attribute 'web-mode-css-rule-face nil :foreground "Pink3")

;;Auto-pairing
(setq web-mode-enable-auto-pairing t)
;;CSS colorization
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-block-face t)
(setq web-mode-enable-part-face t)
(setq web-mode-enable-comment-interpolation t)
(setq web-mode-enable-heredoc-fontification t)

(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

;;(setq web-mode-extra-constants '(("php" . ("CONS1" "CONS2")))

;;add snappet
(setq web-mode-extra-snippets
      '(("erb" . (("toto" . "<% toto | %>\n\n<% end %>")))
        ("php" . (("dowhile" . "<?php do { ?>\n\n<?php } while (|); ?>")
                  ("debug" . "<?php error_log(__LINE__); ?>")))
       ))

;;开启emmet-mode
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'html-mode-hook 'emmet-mode)


(setq emmet-move-cursor-between-quotes t) ;;展开后光标移到引号中间


(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c C-v") 'browse-url-of-buffer))



(provide 'init-html)
;;; init-html.el ends here
