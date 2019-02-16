;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package magit
  :bind (("C-x g" . magit-status))
  :config
  (progn
    (setq magit-completing-read-function 'magit-ido-completing-read)))

(provide 'magit)
;;; magit.el ends here
