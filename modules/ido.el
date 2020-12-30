;;; package --- Summary
;;; Commentary:
;;; Setup projectile
;;; Code:
(require 'ido)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(make-local-variable 'ido-decorations)
(setf (nth 2 ido-decorations) "\n")
(ido-mode 1)

(provide 'ido)
;;; ido.el ends here