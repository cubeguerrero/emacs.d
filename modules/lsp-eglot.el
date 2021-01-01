;;; package --- Summary
;;; Commentary:
;;; LSP Eglot
;;; Code:

(use-package eglot
  :ensure t
  :hook (prog-mode . eglot))

(use-package project
  :ensure t)

(provide 'lsp-eglot)
;;; lsp-eglot.el ends here
