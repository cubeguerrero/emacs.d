;;; package --- Summary
;;; Commentary: Add lsp-mode
;;; Code:

(use-package lsp-mode
  :diminish (lsp-mode)
  :commands lsp
  :config
  (add-hook 'prog-mode-hook #'lsp))

(provide 'lsp)
;;; lsp.el ends here.
