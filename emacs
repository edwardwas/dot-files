(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :config 
  (evil-mode t)
  )

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark )
  )

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  )

(use-package haskell-mode
  :ensure t
  )

(use-package neotree
             :ensure t
             :config
               (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
               (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
               (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
               (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
	       (global-set-key [f8] 'neotree-toggle)
	       )

(use-package powerline
  :ensure t
  :config
  (powerline-vim-theme))

(use-package intero
  :ensure t
  :config
  (intero-global-mode 1)
  )

(use-package hindent
  :ensure t
  :config
  (add-hook 'haskell-mode-hook #'hindent-mode)
  )

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

(setq exec-path (append exec-path '("/home/edward/.local/bin")))



(set-face-attribute 'default nil :height 120)
