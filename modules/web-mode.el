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
         ("\\.vue\\'" . web-mode)
         ("\\.hdbs\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2
       web-mode-css-indent-offset 2
       web-mode-code-indent-offset 2))

(provide 'web-mode)
;;; web-mode.el ends here
