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
  (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
  (setq projectile-mode-line
        '(:eval (format " [%s]" (projectile-project-name))))
  (setq projectile-remember-window-configs t))

(provide 'projectile)
;;; projectile.el ends here
