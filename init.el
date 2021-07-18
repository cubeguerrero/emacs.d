(defvar cubeg/default-font-size 130)
(defvar cubeg/default-variable-font-size 130)
(defvar cubeg/default-modeline-font-size 110)

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
      gc-cons-threshold 100000000
      read-process-output-max (* 1024 1024)
      save-place-file (concat user-emacs-directory "places"))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(set-face-attribute 'default nil :font "Menlo" :height cubeg/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Menlo" :height cubeg/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Times New Roman" :height cubeg/default-variable-font-size :weight 'regular)

(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize))

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(use-package diminish
  :ensure t)

(diminish 'auto-revert-mode)
(diminish 'visual-line-mode)
(diminish 'eldoc-mode)
(diminish 'abbrev-mode)

(use-package modus-themes
  :config
  (load-theme 'modus-operandi t))

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (set-face-attribute 'mode-line nil :family "Menlo" :height cubeg/default-modeline-font-size)
  (set-face-attribute 'mode-line-inactive nil :family "Menlo" :height cubeg/default-modeline-font-size))

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

(setq ido-enable-flex-matching t
     ido-everywhere t
     ido-use-faces nil
     ido-create-new-buffer 'always)
(ido-mode 1)
(ido-everywhere 1)

(use-package flx-ido
  :config
  (flx-ido-mode t))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

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

(defun cubeg/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . cubeg/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
        org-agenda-start-with-log-mode t
        org-log-done 'time
        org-log-into-drawer t)

  (setq org-agenda-files
        '("~/Google Drive/My Drive/Notes/Tasks.org"))

  (setq org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")))

  (setq org-capture-templates
    `(("t" "Tasks / Projects")
      ("tt" "Task" entry (file+olp "~/Google Drive/My Drive/Notes/Tasks.org" "Inbox")
           "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)
      ("j" "Journal Entries")
      ("jj" "Journal" entry
           (file+olp+datetree "~/Google Drive/My Drive/Notes/Journal.org")
           "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
           ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
           :clock-in :clock-resume
           :empty-lines 1)
      ("jm" "Meeting" entry
           (file+olp+datetree "~/Google Drive/My Drive/Notes/Journal.org")
           "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
           :clock-in :clock-resume
           :empty-lines 1)))

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

(defun cubeg/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/.emacs.d/Emacs.org"))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'cubeg/org-babel-tangle-config)))

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

(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-idle-delay 0.500
        lsp-headerline-breadcrumb-enable nil)
  (with-eval-after-load 'lsp-mode
    (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)))

(use-package lsp-ui)

(use-package company
  :diminish (company-mode))

(use-package go-mode
  :mode "\\.go\\'"
  :hook (go-mode . lsp-deferred))

(use-package enh-ruby-mode
  :mode "\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'"
  :hook (enh-ruby-mode . lsp-deferred))

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq pipenv-with-flycheck nil)
  (setq pipenv-projectile-after-switch-function #'pipenv-projectile-after-switch-extended))

(use-package dockerfile-mode)

(use-package yaml-mode
    :mode "\\.yml\\'")

(use-package protobuf-mode)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
