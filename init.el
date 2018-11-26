;;; MyConfig --- asds
;;; Commentary: asd

;;; Code:
(require 'package)
(add-to-list
  'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'eldoc-mode)
(add-hook 'ielm-mode-hook 'eldoc-mode)

(eval-when-compile
  (require 'use-package))

(use-package evil
             :config
             (evil-mode t))

(use-package helm
             :ensure t)

(use-package solarized-theme
             :ensure t
             :config
             (load-theme 'solarized-dark t))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

(use-package org
             :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package slime-company
  :ensure t
  )

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl --noinform --no-linedit")
  (setq slime-contribs '(slime-fancy slime-company))
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "sbcl")
  )

(set-face-attribute 'default nil :height 120)

(use-package haskell-mode
  :ensure t
  )

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :config
  (add-hook 'haskell-mode-hook 'dante-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode 1))

(use-package flycheck-inline
  :ensure t
  :after
  flycheck
  :config
  (flycheck-inline-mode))

(use-package cider
  :ensure t
  )

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 0)
  )

(use-package rust-mode
  :ensure t
  :init
  (add-hook 'rust-mode-hook
	    (lambda () (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  )

(use-package cargo
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'cargo-minor-mode)
  )

(use-package racer
  :ensure t
  :config
  (add-hook 'racer-mode-hook #'company-mode)
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
  )

(use-package flycheck-rust
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  )

;(setq racer-cmd "~/.cargo/bin/racer")
;(setq racer-rust-src-path "/home/edward/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(recentf-mode 1)
(setq-default recentf-save-file "~/.emacs.d/recentf")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (magit rainbow-delimiters flycheck-rust racer-mode eldoc-eval racer cargo rust-mode helm-spotify-plus helm-spotify-plus0 helm-spotify aggressive-fill-paragraph slime-company slime cider flycheck-inline telephone-line dante solarized-them use-package helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )