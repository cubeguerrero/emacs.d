;;; package --- Summary
;;; Commentary:
;;; Elixir
;;; Code:
(use-package elixir-mode
  :ensure t
  :diminish (elixir-mode)
  :config
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t))))

(use-package alchemist
  :ensure t
  :config
  (add-hook 'elixir-mode-hook 'alchemist-mode))

;; A Flycheck checker that uses Mix, so it finds project deps.
;; From https://github.com/ananthakumaran/dotfiles/blob/master/.emacs.d/init-elixir.el#L25-L42
(with-eval-after-load "flycheck"
  (flycheck-define-checker elixir-mix
    "An Elixir syntax checker using the Elixir interpreter.
See URL `http://elixir-lang.org/'."
    :command ("mix"
              "compile"
              source)
    :error-patterns
    ((error line-start "** (" (zero-or-more not-newline) ") "
            (zero-or-more not-newline) ":" line ": " (message) line-end)
     (warning line-start
              (one-or-more (not (syntax whitespace))) ":"
              line ": "
              (message)
              line-end))
    :modes elixir-mode)
  (add-to-list 'flycheck-checkers 'elixir-mix))

(provide 'elixir)
;;; elixir.el ends here.
