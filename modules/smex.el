;;; package --- Summary
;;; Code: Install SMEX
;;; Code:

(use-package smex
  :init (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)
         ("C-c C-c M-x" . 'execute-extended-command)))

(provide 'smex)
;;; smex.el ends here
