;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))

(setq python-shell-interpreter "/usr/local/bin/python3")
(provide 'python)
;;; python.el ends here
