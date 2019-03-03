;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package general
  :ensure t
  :config
  (general-evil-setup t))

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(provide 'evil)
;;; evil.el ends here
