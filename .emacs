;; Disable startup screen
(setq inhibit-startup-screen t)

;; disable menu bar
(menu-bar-mode 0)

;; mepla package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company lsp-ui lsp-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'lsp-mode)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
(setq lsp-clangd-executable "/opt/homebrew/opt/llvm/bin/clangd")


(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Optional: Configure company mode
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)

;; Optional: Enable lsp-ui for additional features
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; show relative line numbers
(setq display-line-numbers-type 'relative) 
(global-display-line-numbers-mode)

