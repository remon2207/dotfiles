(package-initialize)
(require 'package)
(add-to-list 'package-archives
	'("melpa-stable" . "https://stable.melpa.org/packages/") t)

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

(load-theme 'solarized-dark t)

(require 'linum)

(defalias 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode 0)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-c\C-h" 'help-command)
(electric-pair-mode 1)
(column-number-mode t)
(global-linum-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message 1)
(setq initial-scratch-message "")
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))
(setq mouse-wheel-progressive-speed nil)
(setq case-fold-search t)
