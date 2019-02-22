;;; package --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist '(font . "IBM Plex Mono-15" ))

(when (member "IBM Plex Mono" (font-family-list))
  (set-frame-font "IBM Plex Mono-15" t t))
(set-face-attribute 'fringe nil
                  :foreground (face-foreground 'default)
                  :background (face-background 'default))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-items '((projects . 5)
                        (agenda . 5)))
  (dashboard-setup-startup-hook))

(use-package apropospriate-theme
  :ensure t
  :config
  (load-theme 'apropospriate-light t))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-init)
  :config
  (setq doom-modeline-icon t))

(use-package all-the-icons
  :commands (all-the-icons-install-fonts))

(provide 'ui)
;;; ui.el ends here.
