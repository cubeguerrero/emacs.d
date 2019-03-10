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

(use-package vue-mode
  :ensure t
  :mode (("\\.vue\\'" . vue-mode))
  :config
  (setq js-indent-level 2))

(provide 'javascript)
;;; javascript.el ends here
