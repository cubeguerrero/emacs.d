;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :config
  (setq magit-completing-read-function 'ivy-completing-read))

(provide 'mmagit)
;;; magit.el ends here
