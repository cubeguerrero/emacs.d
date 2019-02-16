;;; package --- Summary
;;; Commentary:
;;; Add lsp-mode
;;; Code:

(use-package lsp-mode
  :diminish (lsp-mode)
  :config
  (add-hook 'prog-mode-hook #'lsp))

(use-package company-lsp
  :config
  (push 'company-lsp company-backends))

(provide 'lsp)
;;; lsp.el ends here
