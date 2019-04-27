;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist '(font . "IBM Plex Mono-14"))

(when (member "IBM Plex Mono" (font-family-list))
  (set-frame-font "IBM Plex Mono-14" t t))

(set-face-attribute 'fringe nil
                  :foreground (face-foreground 'default)
                  :background (face-background 'default))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-center-content t
        dashboard-items '((projects . 10)
                          (agenda . 5)))
  (dashboard-setup-startup-hook))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-org-config)
  (load-theme 'doom-one-light t))

(provide 'ui)
;;; ui.el ends here
