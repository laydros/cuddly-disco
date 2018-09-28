;; Whatever, nuke it all. 2018-09-21 - JWH

;; TODO: I need emacs to support sdate and fdate

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-enable-at-startup nil)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (package-initialize))

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; don't need to say ensure when using use-package
(setq use-package-always-ensure t)

(setq user-full-name "Jason Hamilton")
(setq user-mail-address "jwh@laydros.net")

;;
;; interface
;;

(line-number-mode 1)
(column-number-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(display-time)
(electric-pair-mode t)
(show-paren-mode t)
(tool-bar-mode  -1)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)
(setq-default fill-column 80)
(setq
 inhibit-startup-message t
 inhibit-startup-screen t
 confirm-kill-emacs 'y-or-n-p
 ;; select help window so it's easy to quit it with 'q'
 help-window-select t)

;;
;; files
;;

(global-auto-revert-mode t)

;; Always use utf-8
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq
 make-backup-files nil
 require-final-newline t)

;;
;; editing and movement
;;

;; cursor movement stops in camelCase words
(global-subword-mode t)
;; indention
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(setq tab-width 2)

;;
;; keybinding
;;

(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-;") 'comment-line)


;; what TODO
;; ido stuff, should be smoother when using C-x C-f

;; setup org
;; setup magit
;; maybe do the literate programming thing for this so I have notes in it
;; possibly a new dotfiles repo?

(use-package company
  :ensure t
  :init
  ;; https://emacs.stackexchange.com/a/10838
  (setq company-dabbrev-downcase nil)
  :config
  (global-company-mode))

(setq tramp-default-method "ssh")

;; TODO - I don't remember what this means
;; (global-font-lock-mode 1)
;; This might be on by default now.
;; I know I want this but I don't quite remember what it does.
;; (transient-mark-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
