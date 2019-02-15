;;; package --- Summary
;;; Commentary: Setup projectile
;;; Code:
(use-package projectile
  :diminish (projectile-mode)
  :config
  (add-to-list 'projectile-globally-ignored-directories "*node_modules")
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-mode-line
        '(:eval (format " [%s]" (projectile-project-name))))
  (setq projectile-remember-window-configs t))

(provide 'projectile)
;;; projectile.el ends here.
