;;; package --- Summary
;;; Commentary: Flycheck
;;; Code:
(use-package flycheck
  :diminish (flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package lsp-ui
  :diminish (lsp-ui-mode)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(provide 'flycheck)
;;; flycheck.el ends here
