;;; package --- Summary
;;; Commentary:
;;; Add lsp-mode
;;; Code:

(use-package lsp-mode
  :ensure t
  :diminish (lsp-mode)
  :config
  (add-hook 'prog-mode-hook #'lsp))

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-ui
  :ensure t
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(provide 'lsp)
;;; lsp.el ends here
