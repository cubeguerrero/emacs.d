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
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height 120)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Helvetica" :height 120 :weight 'regular)

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
;;; ido
(setq ido-enable-flex-matching t
     ido-everywhere t
     ido-use-faces nil
     ido-create-new-buffer 'always)
(ido-mode 1)
(ido-everywhere 1)

(use-package flx-ido
  :config
  (flx-ido-mode t))

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

;;; Whichkey
(use-package which-key
  :config
  (setq which-key-idle-delay 0.3))

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
        projectile-switch-project-action #'projectile-dired
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

;;; Ruby
(use-package enh-ruby-mode
  :mode "\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'"
  :hook (enh-ruby-mode . lsp-deferred))

;;; Org
(defun cubeg/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(defun cubeg/org-font-setup ()
  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Helvetica" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org
  :hook (org-mode . cubeg/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (cubeg/org-font-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun cubeg/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . cubeg/org-mode-visual-fill))

;; Write other customization above this
;; Do not litter the init file, all settings done in
;; customize-mode will be written in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
