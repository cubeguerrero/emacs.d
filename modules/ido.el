;;; package --- Summary
;;; Commentary: Ido mode
;;; Code:

(use-package flx)
(use-package flx-ido
  :requires flx
  :config
  (flx-ido-mode 1))

(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))

(use-package ido-yes-or-no
  :config
  (ido-yes-or-no-mode 1))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(ido-mode 1)
(ido-everywhere 1)

(provide 'ido)
;;; ido.el ends here
