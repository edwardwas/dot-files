;; -*- lexical-binding: t; -*-
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(global-so-long-mode 1)

(setq backup-directory-alist `(("." . "~/.saves")))
(straight-use-package 'use-package)

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate #'command-completion-default-include-p))

(use-package magit
  :straight t)

(use-package direnv
  :straight t
  :config
  (direnv-mode))

(use-package parinfer-rust-mode
  :straight t
  :hook clojure-mode)

(use-package golden-ratio
  :straight t)

(use-package transpose-frame
  :straight t)

(use-package column-enforce-mode
  :straight t)

(use-package web-mode
  :straight t
  :init (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode)))

(use-package smex
  :straight t
  :config
  (smex-initialize)
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c C-c M-x" . execute-extended-command))

(use-package evil
  :demand t
  :straight t
  :config
  (evil-mode 1))

(use-package solarized-theme
  :straight t
  :config
  (load-theme 'solarized-dark t))

(use-package rainbow-delimiters
  :straight t)

(use-package org
  :straight t)

(use-package markdown-mode
  :straight t
  :commands (markdown-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package flycheck
  :straight t
  :config
  (global-flycheck-mode))

(use-package yasnippet
  :staight t
  (yas-global-mode))

(use-package telephone-line
  :straight t
  :config
  (telephone-line-mode 1))

(use-package flycheck-clj-kondo
  :straight t)

(use-package cider
  :straight t
  :init
  (setq cider-show-error-buffer nil)
  (setq cider-use-tooltips t)
  (setq cider-test-default-exclude-selectors '("flakey"))
  :config
  (require 'flycheck-clj-kondo)
  :bind
  (("C-c C-f" . cider-format-buffer)))

(use-package avy
  :straight t)

(use-package haskell-mode
  :straight t
  :bind
  (("C-c C-." . lsp-execute-code-action)
   ("C-c C-f" . lsp-format-buffer)))

(use-package lsp-mode
  :config
  :bind
  (("C-c C-." . lsp-execute-code-action)
   ("C-c C-f" . lsp-format-buffer))
  :hook (haskell-mode . lsp)
  :hook (rust-mode . lsp)
  :straight t)

(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode)

(use-package lsp-haskell
  :straight t)

(use-package rust-mode
  :straight t)

(use-package dhall-mode
  :straight t
  :mode "\\.dhall\\'")

(use-package exec-path-from-shell
  :ensure t
  :straight t
  :config
  (exec-path-from-shell-initialize))

(use-package corfu
             :straight t
             :init (global-corfu-mode))

(use-package writeroom-mode
             :straight t)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(recentf-mode 1)
(setq-default recentf-save-file "~/.emacs.d/recentf")

(define-key key-translation-map (kbd "M-3") (kbd "#"))

(add-to-list 'exec-path "/usr/local/bin")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0"
     "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4"
     default))
 '(gc-cons-threshold 200000000)
 '(indent-tabs-mode nil)
 '(lsp-haskell-completion-in-comments nil)
 '(lsp-haskell-formatting-provider "fourmolu")
 '(lsp-haskell-plugin-class-global-on nil)
 '(lsp-haskell-plugin-splice-global-on nil)
 '(lsp-haskell-plugin-stan-global-on nil)
 '(lsp-haskell-plugin-tactics-global-on t)
 '(ns-use-native-fullscreen nil)
 '(org-agenda-files '("~/dnd/spelljammer/main.org"))
 '(org-babel-load-languages '((sql . t)))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(warning-suppress-log-types '((use-package))))
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 141 :width normal :foundry "nil" :family "Fira Code")))))
