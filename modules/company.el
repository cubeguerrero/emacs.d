;;; package --- Summary
;;; Commentary:
;;; Company mode
;;; Code:

(use-package company
  :ensure t
  :diminish (company-mode)
  :config
  (setq company-tooltip-align-annotations t)
  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-flx
  :ensure t)

(eval-after-load 'company
  '(progn
     (company-flx-mode +1)
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "S-TAB") 'company-select-previous)))

(provide 'company)
;;; company.el ends here
