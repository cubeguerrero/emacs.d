;;; package --- Summary
;;; Commentary:
;;; Elixir
;;; Code:
(use-package elixir-mode
  :diminish (elixir-mode)
  :config
  (add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t))))

(provide 'elixir)
;;; elixir.el ends here
