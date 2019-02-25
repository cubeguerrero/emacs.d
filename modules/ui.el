;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist '(font . "Fira Code-15" ))

(when (member "Fira Code" (font-family-list))
  (set-frame-font "Fira Code-15" t t)
  (mac-auto-operator-composition-mode))
(set-face-attribute 'fringe nil
                  :foreground (face-foreground 'default)
                  :background (face-background 'default))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-items '((projects . 5)
                        (agenda . 5)))
  (dashboard-setup-startup-hook))

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (load-theme 'sanityinc-tomorrow-day t))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-init)
  :config
  (setq doom-modeline-icon t))

(use-package all-the-icons
  :commands (all-the-icons-install-fonts))

(provide 'ui)
;;; ui.el ends here.
