;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist '(font . "Menlo-13"))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . light))

(when (member "Menlo" (font-family-list))
  (set-frame-font "Menlo-13" t t))

(setq line-spacing 1)

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-center-content t
        dashboard-set-heading-icons t
        dashboard-set-file-icons 5
        dashboard-items '((recents . 5)
                          (projects . 5)))
  (dashboard-setup-startup-hook))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-icon t)
  (setq doom-modeline-lsp t))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one-light t))

(provide 'ui)
;;; ui.el ends here
