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
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" default))
 '(package-selected-packages
   '(multiple-cursors gruber-darker-theme company lsp-ui lsp-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; change autosave directory
(setq auto-save-file-name-transforms
  `((".*" "~/.emacs.d/autosaves/" t)))

;; set theme
(load-theme 'gruber-darker)

(require 'multiple-cursors)

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

