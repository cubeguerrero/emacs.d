
;;; package --- Summary
;;; Commentary:
;;; Setup projectile
;;; Code:
(use-package projectile
  :ensure t
  :diminish (projectile-mode)
  :config
  (add-to-list 'projectile-globally-ignored-directories "*node_modules")
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-mode-line
        '(:eval (format " [%s]" (projectile-project-name))))
  (setq projectile-remember-window-configs t
        projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t
  :diminish (counsel-projectile-mode)
  :config
  (counsel-projectile-mode 1))

(provide 'projectile)
;;; projectile.el ends here
