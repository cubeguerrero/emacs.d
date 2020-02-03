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

(use-package typescript-mode
  :ensure t
  :mode (("\\.ts\\'" . typescript-mode)))

(provide 'javascript)
;;; javascript.el ends here
