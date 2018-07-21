;; Write other customization above this
;; Do not litter the init file, all settings done in
;; customize-mode will be written in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/")
             '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

(org-babel-load-file "~/.emacs.d/configuration.org")

;; Set personal information
(setq user-full-name "Cuthbert Allan Y. Guerrero"
      user-mail-address "cuthbert.guerrero@gmail.com")
