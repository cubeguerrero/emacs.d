;;; package --- Summary
;;; Commentary:
;;; Flycheck
;;; Code:
(use-package flycheck
  :ensure t
  :diminish (flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'flycheck)
;;; flycheck.el ends here
