;;; package --- summary
;;; commentary:
;;; code:
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(;;("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ;; ("melpa" . "http://elpa.emacs-china.org/melpa/")
			    ("elpa" . "https://elpa.gnu.org/packages/")
			   ("melpa" . "http://melpa.org/packages/") )))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl-lib)
(require 'cl)

;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		       company
		       company-quickhelp
                       company-jedi
		       company-web
                       company-php
                      
                       ;lsp-mode
                       ;lsp-treemacs
                       ;dap-mode
                       
                       ac-php
                       flymake-php 
                       php-mode
		       web-completion-data
		       which-key
		       flycheck
                       tramp
                       image+
		       ;; --- Better Editor ---
		       better-defaults
		       popwin
                       mmm-mode
		hungry-delete
		swiper
		counsel
		smartparens
		neotree
		better-defaults
                session
                org-bullets
                embark
                marginalia
                browse-kill-ring
                pdf-tools
	;;	go-translate
		;; --- Major Mode ---
		;;js2-mode
		use-package
		web-mode
		htmlize
		yasnippet
		markdown-mode
		;;pyenv-mode
		highlight-indentation
		all-the-icons
		
		;;=======python环境=================
		ipython-shell-send
                exec-path-from-shell
                pyenv-mode
		elpy  
		python-mode
                
		py-autopep8
		blacken
                virtualenvwrapper
                anaconda-mode
		ein     ;;Emacs IPython Notebook
		;;=================================
		
		;; ====== Minor Mode ==============
		;;nodejs-repl
		
		;; --- Themes ---
		monokai-theme
		solarized-theme
		melancholy-theme
		spacemacs-theme
                                   gruvbox-theme
		zenburn-theme
                color-theme-sanityinc-tomorrow
		color-theme-sanityinc-solarized
                       material-theme
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (cl-loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 ;;(when (memq window-system '(mac ns))
  ;; (exec-path-from-shell-initialize))

(provide 'init-packages)
