;; General Configuration
;;; User Interface
(set-language-environment "UTF-8")

(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(delete-selection-mode 1)
(global-auto-revert-mode 1)
(global-font-lock-mode t)
(show-paren-mode 1)
(transient-mark-mode 1)
(mac-auto-operator-composition-mode 1) ;; only available on railwaycat mac version

(setq-default show-paren-delay 0
              indent-tabs-mode nil
              save-place t
              dired-listing-switches "-alh"
              major-mode #'text-mode)

(setq ring-bell-function 'ignore
      load-prefer-newer t
      save-interprogram-paiste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat user-emacs-directory "places"))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(set-face-attribute 'default nil :font "Fira Code Retina" :height 120)

(load-theme 'leuven)

;;; Use-Package Setup
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("org" . "https://orgmode.org/elpa/"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Packages
;;; Ido
(setq ido-enable-flex-matching t
      ido-everywhere t
      ido-create-new-buffer 'always)
(ido-mode 1)

;;; Diminish
(use-package diminish
  :ensure t)

(diminish 'auto-revert-mode)
(diminish 'visual-line-mode)
(diminish 'eldoc-mode)
(diminish 'abbrev-mode)

;;; Ace Window
(use-package ace-window
  :bind (("M-o" . ace-window)))

;;; Icons
(use-package all-the-icons)

;;; Doom Modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (set-face-attribute 'mode-line nil :family "Fira Code Retina" :height 100)
  (set-face-attribute 'mode-line-inactive nil :family "Fira Code Retina" :height 100))

;;; Exec Path from Shell
(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
    :init (exec-path-from-shell-initialize)))

;;; Projectile
(use-package projectile
  :diminish (projectile-mode)
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map))
  :config
  (add-to-list 'projectile-globally-ignored-directories "*node_modules")
  (setq projectile-mode-line
        '(:eval (format " [%s]" (projectile-project-name))))
  (when (file-directory-p "~/Code")
    (setq projectile-project-search-path '("~/Code")))
  (setq projectile-remember-window-configs t
        projectile-completion-system 'ido))

;;; Ag
(use-package ag)

;;; Magit
(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

;;; LSP
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-headerline-breadcrumb-enable nil))

;;; Company mode
(use-package company
  :diminish (company-mode))

;;; Go
(use-package go-mode
  :mode "\\.go\\'"
  :hook (go-mode . lsp-deferred))

;; Write other customization above this
;; Do not litter the init file, all settings done in
;; customize-mode will be written in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
