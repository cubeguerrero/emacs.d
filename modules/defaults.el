;;; package --- Summary
;;; Commentary: Better defaults
;;; Code:

(progn
  (set-language-environment "UTF-8")

  (fset 'yes-or-no-p 'y-or-n-p)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (horizontal-scroll-bar-mode -1)
  (delete-selection-mode 1)
  (global-auto-revert-mode 1)
  (show-paren-mode 1)

  (setq-default show-paren-delay 0
                indent-tabs-mode nil
                save-place t
                major-mode #'text-mode)
  
  (setq ring-bell-function 'ignore
        load-prefer-newer t
        save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        require-final-newline t
        ediff-window-setup-function 'ediff-setup-windows-plain
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
  
  (global-set-key (kbd "M-/") 'hippie-expand)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (global-set-key (kbd "M-z") 'zap-up-to-char)

  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)

  (add-hook 'emacs-startup-hook 'toggle-frame-maximized))

(provide 'defaults)
;;; defaults.el ends here.
