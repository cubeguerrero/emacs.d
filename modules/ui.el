;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist '(font . "IBM Plex Mono-15" ))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(when (member "IBM Plex Mono" (font-family-list))
  (set-frame-font "IBM Plex Mono-15" t t))
(set-face-attribute 'fringe nil
                  :foreground (face-foreground 'default)
                  :background (face-background 'default))

(use-package doom-themes
  :ensure t
  :config
  (doom-themes-org-config)
  (load-theme 'doom-one-light t))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-init)
  :config
  (setq doom-modeline-icon t))

(use-package all-the-icons
  :commands (all-the-icons-install-fonts))

(provide 'ui)
;;; ui.el ends here.
