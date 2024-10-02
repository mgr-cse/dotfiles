;; Some sane default variables
(setq-default inhibit-startup-screen t)
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)
(setq-default tab-width 4)
(setq-default compilation-scroll-output t)

;; Disable useless UI options
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; tsoding rc package manager
(require 'package)
(load "~/.emacs.rc/rc.el")
(package-initialize)

;; file where emacs can put it's custom set variables  
(setq custom-file "~/.emacs.custom.el")
(load custom-file)

;; show relative line numbers
(setq display-line-numbers-type 'relative) 
(global-display-line-numbers-mode)

;; ido completion
(ido-mode 1)
(ido-everywhere 1)

;; ido for M-x
(rc/require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; set theme
(rc/require-theme 'vs-light)

;; command for interactive terminal
(defun bash ()
  (interactive)
  (term "/opt/homebrew/bin/bash"))

;; install support for multiple cursors
(rc/require 'multiple-cursors)

;; package for autocompletion
(rc/require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Optional: Configure company mode
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)

;(rc/require 'lsp-mode)
;(add-hook 'c-mode-hook #'lsp)
;(add-hook 'c++-mode-hook #'lsp)
;(setq lsp-clangd-executable "/opt/homebrew/opt/llvm/bin/clangd")

;; Optional: Enable lsp-ui for additional features
;(rc/require 'lsp-ui)
;(add-hook 'lsp-mode-hook 'lsp-ui-mode)
