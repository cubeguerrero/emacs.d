;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist '(font . "Anonymous Pro-15" ))
(when (member "Anonymous Pro" (font-family-list))
  (set-frame-font "Anonymous Pro-15" t t))
(set-face-attribute 'fringe nil
                  :foreground (face-foreground 'default)
                  :background (face-background 'default))

(use-package doom-themes
  :config
  (doom-themes-org-config)
  (load-theme 'doom-tomorrow-day t))

(use-package doom-modeline
  :defer t
  :hook (after-init . doom-modeline-init)
  :config
  (setq doom-modeline-icon t))

(use-package all-the-icons
  :commands (all-the-icons-install-fonts))

(provide 'ui)
;;; ui.el ends here.
