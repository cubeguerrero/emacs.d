;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package web-mode
  :diminish (web-mode)
  :ensure t
  :mode (("\\.eex\\'" . web-mode)
         ("\\.erb\\'" . web-mode)
         ("\\.html?\\'" . web-mode)
         ("\\.djhtml\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)
         ("\\.hdbs\\'" . web-mode)))

(provide 'web-mode)
;;; web-mode.el ends here
