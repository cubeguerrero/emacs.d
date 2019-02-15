

(load "~/.emacs.d/modules/initialize.el")
(load "~/.emacs.d/modules/osx.el")
(load "~/.emacs.d/modules/defaults.el")
(load "~/.emacs.d/modules/diminish.el")
(load "~/.emacs.d/modules/ui.el")
(load "~/.emacs.d/modules/smex.el")
(load "~/.emacs.d/modules/ido.el")
(load "~/.emacs.d/modules/term.el")
(load "~/.emacs.d/modules/projectile.el")


;; Set personal information
(setq user-full-name "Cuthbert Allan Y. Guerrero"
      user-mail-address "cuthbert.guerrero@gmail.com")

;; Write other customization above this
;; Do not litter the init file, all settings done in
;; customize-mode will be written in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
