;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist '(font . "Victor Mono-14"))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . light))

(when (member "Victor Mono" (font-family-list))
  (set-frame-font "Victor Mono" t t))

(setq line-spacing 1)

; (mac-auto-operator-composition-mode)

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-center-content t
        dashboard-set-heading-icons t
        dashboard-set-file-icons 5
        dashboard-items '((recents . 5)
                          (projects . 5)))
  (dashboard-setup-startup-hook))

(provide 'ui)
;;; ui.el ends here
