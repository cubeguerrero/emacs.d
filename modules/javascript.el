;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode))
  :config
  (setq js2-basic-offset 2))

(use-package json-mode
  :ensure t)

(use-package company-tern
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook (lambda ()
                             (tern-mode))))

(provide 'javascript)
;;; javascript.el ends here
