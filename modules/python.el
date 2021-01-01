;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package pipenv
  :ensure t
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

(setq python-shell-interpreter "/usr/local/bin/python3")

(provide 'python)
;;; python.el ends here
