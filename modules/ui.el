;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist '(font . "JetBrains Mono-13"))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . light))

(when (member "JetBrains Mono" (font-family-list))
  (set-frame-font "JetBrains Mono-13" t t))

(setq line-spacing 1)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (load-theme 'sanityinc-tomorrow-day t))

(provide 'ui)
;;; ui.el ends here
