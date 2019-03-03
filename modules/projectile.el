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
  (general-define-key "C-c p" '(:keymap projectile-command-map :package projectile))
  (setq projectile-mode-line
        '(:eval (format " [%s]" (projectile-project-name))))
  (setq projectile-remember-window-configs t))

(provide 'projectile)
;;; projectile.el ends here
