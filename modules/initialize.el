;;; packages --- Summary
;;; Commentary: Setup Packages and Intall use-package
;;; Code:

(progn
  (require 'package)
  (package-initialize)

  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/")
               '("org" . "http://orgmode.org/elpa/"))

  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (eval-when-compile
    (require 'use-package))
  (setq use-package-verbose t
        use-package-always-ensure t))

(provide 'initialize)
;;; initialize.el ends here.
