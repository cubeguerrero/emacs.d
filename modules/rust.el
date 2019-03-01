;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package rust-mode
  :ensure t
  :mode (("\\.rs\\'" . rust-mode)))

(use-package racer
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode))

(use-package company-racer
  :ensure t)

(use-package flycheck-rust
  :ensure t
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(provide 'rust)
;;; rust.el ends here
