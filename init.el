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
(add-hook 'text-mode-hook (lambda ()
			    (flyspell-mode 1)))
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(eval-when-compile
  (require 'use-package))

(use-package magit
  :ensure t)

(use-package forge
  :after magit)

(use-package github-review
  :after forge)

(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
            pretty-parens  ; different paren styles for different modes.
            evil           ; If you use Evil.
            smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))

;; JavaScript and TypeScript
(use-package js2-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-formater-before-save)))

(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
  (setq web-mode-enable-current-element-highlight t))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-scope 'frame)
  )

(use-package ac-emoji
  :config
  (add-hook 'markdown-mode-hook 'ac-emoji-setup)
  (add-hook 'git-commit-mode-hook 'ac-emoji-setup)
  )

(use-package exec-path-from-shell
  :ensure t)

(use-package transpose-frame
  :ensure t)

(use-package column-enforce-mode
  :ensure t)

(use-package intero
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(use-package smex
  :ensure t
  :config
  (smex-initialize)
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c C-c M-x" . execute-extended-command))

(use-package evil
  :config
  (evil-mode t))

(use-package helm
             :ensure t)

(use-package projectile
  :ensure t)

(use-package helm-projectile
  :bind ("C-p" . helm-projectile-fuzzy-match)
  :ensure t)

(use-package buffer-move
  :ensure t)

(use-package srefactor
  :ensure t)

(use-package highlight-parentheses
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

(set-face-attribute 'default nil :height 140)

(use-package haskell-mode
  :ensure t
  )

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
  :init
  (setq cider-show-error-buffer 'only-in-repl)
  (setq cider-show-error-buffer nil)
  (setq cider-use-tooltips t)
  :bind
  (("C-c TAB" . cider-format-buffer))
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

(use-package lispy
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
  )

;; (use-package neotree
;; ;;   :bind ("C-x C-f" . 'neotree)
;; ;;   :config
;; ;;   (setq neo-theme 'nerd)
;; ;;   :ensure t)

					;(setq racer-cmd "~/.cargo/bin/racer")
					;(setq racer-rust-src-path "/home/edward/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(recentf-mode 1)
(setq-default recentf-save-file "~/.emacs.d/recentf")

(define-key key-translation-map (kbd "M-3") (kbd "#"))


(add-to-list 'exec-path "/usr/local/bin")

;; ATL Stuff

(load "/Users/edward/git_repos/nuvo/atl-lsp/emacs/atl-mode.el")
(setq atl-lsp-jar "/Users/edward/git_repos/nuvo/atl-lsp/target/atl-lsp-0.1.0-SNAPSHOT-standalone.jar")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(package-selected-packages
   (quote
    (parinfer lsp-mode evil-cleverparens github-review forge clj-refactor ac-emoji dark-souls column-enforce-mode centered-window web-mode tide hindent intero multiple-cursors md4rd transpose-frame smex solarized-theme ido-completing-read+ exec-path-from-shell evil-surround neotree helm-projectile projectile srefactor-lisp srefactor buffer-move highlight-parentheses hightlight-parentheses lispy magit rainbow-delimiters flycheck-rust racer-mode eldoc-eval racer cargo rust-mode helm-spotify-plus helm-spotify-plus0 helm-spotify aggressive-fill-paragraph slime-company slime cider flycheck-inline telephone-line dante solarized-them use-package helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
