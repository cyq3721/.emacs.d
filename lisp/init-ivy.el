;;; package --- summary
;;; commentary:
;;; code:
(ivy-mode t)
(counsel-mode t)
;;(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "C-x C-@") 'counsel-mark-ring)
(global-set-key (kbd "C-x C-SPC") 'counsel-mark-ring)
(provide 'init-ivy)

(use-package amx
  :ensure t
  :init (amx-mode 1))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . 'ace-window)))
;;; init-ivy.el ends here
