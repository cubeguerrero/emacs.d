;;; package --- Summary
;;; Commentary:
;;; Code:

(load "~/.emacs.d/modules/initialize.el")
(load "~/.emacs.d/modules/osx.el")
(load "~/.emacs.d/modules/defaults.el")
(load "~/.emacs.d/modules/diminish.el")
(load "~/.emacs.d/modules/ui.el")
(load "~/.emacs.d/modules/magit")
(load "~/.emacs.d/modules/ag.el")
(load "~/.emacs.d/modules/ido.el")
(load "~/.emacs.d/modules/ace-window.el")
(load "~/.emacs.d/modules/projectile.el")

(load "~/.emacs.d/modules/lsp-eglot.el")

(load "~/.emacs.d/modules/go.el")
(load "~/.emacs.d/modules/javascript.el")
(load "~/.emacs.d/modules/python.el")
(load "~/.emacs.d/modules/ruby.el")
(load "~/.emacs.d/modules/web-mode.el")
(load "~/.emacs.d/modules/yaml.el")

(server-start)
;; Set personal information
(setq user-full-name "Cuthbert Allan Y. Guerrero"
      user-mail-address "cuthbert.guerrero@gmail.com")

;; Write other customization above this
;; Do not litter the init file, all settings done in
;; customize-mode will be written in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
;;; init.el ends here
