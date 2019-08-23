;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist '(font . "IBM Plex Mono-14"))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . light))

(when (member "IBM Plex Mono" (font-family-list))
  (set-frame-font "IBM Plex Mono-14" t t))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-center-content t
        dashboard-set-heading-icons t
        dashboard-set-file-icons 5
        dashboard-items '((recents . 5)
                          (projects . 5)))
  (dashboard-setup-startup-hook))

(use-package apropospriate-theme
  :ensure t
  :config
  (load-theme 'apropospriate-light t))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-icon t)
  (setq doom-modeline-lsp t))

(provide 'ui)
;;; ui.el ends here
