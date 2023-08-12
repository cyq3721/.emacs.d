;;; package --- summary
;;; commentary:
;;; code:

(require 'go-translate)

(setq gts-translate-list '(("en" "zh")))
(setq gts-default-translator
      (gts-translator
       :picker (gts-prompt-picker)
       :engines (list (gts-google-engine) (gts-google-rpc-engine))
       :render (gts-buffer-render)))

(provide 'init-translate)
;;; init-translate.el ends here
