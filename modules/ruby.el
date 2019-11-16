;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package enh-ruby-mode
  :ensure t
  :mode (("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . ruby-mode)))

(use-package slim-mode
  :ensure t)

(provide 'ruby)
;;; ruby.el ends here
