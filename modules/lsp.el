;;; package --- Summary
;;; Commentary:
;;; Add lsp-mode
;;; Code:

(use-package lsp-mode
  :ensure t
  :hook (prog-mode . lsp)
  :diminish (lsp-mode))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(provide 'lsp)
;;; lsp.el ends here
