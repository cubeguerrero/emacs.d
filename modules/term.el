
;;; package --- Summary
;;; Commentary: Setup term
;;; Code:

(defun cube/shell-pop ()
  "Opens up a new terminal in the directory associated with the current buffer's file."
  (interactive)
  (if (boundp 'projectile-project-p)
      (if (projectile-project-p)
          (projectile-with-default-dir (projectile-project-root) (shell-pop))
        (shell-pop))
    (message "Hi Cube")
    (shell-pop)))

(defun cube/test-function ()
  "Test function"
  (interactive)
  (message "Hi Cube")
  (shell-pop t))

(use-package shell-pop
  :bind (("C-c t" . cube/test-function))
  :config
  (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  (setq shell-pop-term-shell "/usr/local/bin/zsh")
  (setq shell-pop-window-position "top")
  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))

(provide 'term)
;;; term.el ends here.
