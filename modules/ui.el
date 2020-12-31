;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist '(font . "JetBrains Mono-12"))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . light))

(when (member "JetBrains Mono" (font-family-list))
  (set-frame-font "JetBrains Mono" t t))

(setq line-spacing 1)

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-operandi t))

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'respectful
        sml/no-confirm-load-theme t)
  (sml/setup))

(provide 'ui)
;;; ui.el ends here
