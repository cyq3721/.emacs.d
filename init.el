;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "28.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))


;; Adjust garbage collection threshold for early startup (see use of gcmh below)
(setq gc-cons-threshold (* 128 1024 1024))


;; Process performance tuning

(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)


;; Bootstrap config



;;(require 'init-utils)
;;(require 'init-site-lisp)

;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages

(setq custom-file (locate-user-emacs-file "custom.el"))

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-find)  ;;配置 counsel，ivy 等
(require 'init-osx-keys)
(require 'init-gui-frames)  ;;取消工具栏，隐藏启动画面等
(require 'init-corfu)
(require 'init-editing-utils)
(require 'init-minibuffer)
(require 'init-ibuffer)
(require 'init-org)
(require 'init-markdown)
(require 'init-dired)
(require 'init-html)
(require 'init-company)
(require 'init-themes)

;(require 'init-my-emacs)
