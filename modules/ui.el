;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist '(font . "IBM Plex Mono-14"))

(when (member "IBM Plex Mono" (font-family-list))
  (set-frame-font "IBM Plex Mono-14" t t)
  (mac-auto-operator-composition-mode))

(set-face-attribute 'fringe nil
                  :foreground (face-foreground 'default)
                  :background (face-background 'default))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-items '((projects . 10)
                        (agenda . 5)))
  (dashboard-setup-startup-hook))

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (load-theme 'sanityinc-tomorrow-day t))

(provide 'ui)
;;; ui.el ends here
