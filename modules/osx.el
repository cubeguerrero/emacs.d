;;; package --- Summary
;;; Commentary:
;;; Code:
(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq-default ls-lisp-dirs-first t
                ls-lisp-use-insert-directory-program nil)

  (setq-default mac-option-key-is-meta nil
                mac-command-key-is-meta t
                mac-command-modifier 'meta
                mac-option-modifier 'none)
  (use-package exec-path-from-shell
    :config
    (setq exec-path-from-shell-arguments '("-l"))
    (exec-path-from-shell-initialize)))

(provide 'osx)
;;; osx.el ends here.
