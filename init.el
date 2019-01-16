;;; package --- Summary
;;; Commentary:
;;; Code:
;; Write other customization above this
;; Do not litter the init file, all settings done in
;; customize-mode will be written in custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(org-babel-load-file "~/.emacs.d/README.org")

;; Set personal information
(setq user-full-name "Cuthbert Allan Y. Guerrero"
      user-mail-address "cuthbert.guerrero@gmail.com")

(provide 'init)
;;; init.el ends here
