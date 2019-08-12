;;; package --- Summary
;;; Commentary:
;;; Add lsp-mode
;;; Code:

(use-package lsp-mode
  :ensure t
  :hook (prog-mode . lsp)
  :diminish (lsp-mode)
  :config
  (setq lsp-prefer-flymake nil
        lsp-enable-snippet nil))

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil
        lsp-ui-flycheck-enable t
        lsp-ui-imenu-enable t
        lsp-ui-sideline-ignore-duplicate t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(provide 'lsp)
;;; lsp.el ends here
