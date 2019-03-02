;;; package --- Summary
;;; Commentary:
;;; Setup term
;;; Code:

;; Open multi-term consider projectile root
(defun cube/multi-term ()
  "Opens up a new terminal in the directory associated with the current buffer's file."
  (interactive)
  (if (projectile-project-p)
      (projectile-with-default-dir (projectile-project-root) (multi-term))
    (multi-term)))

;; Vertical split multi-term
(defun cube/multi-term-vertical ()
  "Opens up a new terminal in the directory associated with the current buffer's file."
  (interactive)
  (split-window-right)
  (other-window 1)
  (if (projectile-project-p)
      (projectile-with-default-dir (projectile-project-root) (multi-term))
    (multi-term)))

;; Horizontal split multi-term
(defun cube/multi-term-horizontal ()
  "Opens up a new terminal in the directory associated with the current buffer's file."
  (interactive)
  (split-window-below)
  (other-window 1)
  (if (projectile-project-p)
      (projectile-with-default-dir (projectile-project-root) (multi-term))
    (multi-term)))

(use-package multi-term
  :ensure t
  :commands (multi-term)
  :bind (("C-c t v" . cube/multi-term-vertical)
         ("C-c t h" . cube/multi-term-horizontal)
         ("C-c t t" . cube/multi-term))
  :config
  (setq multi-term-program "/usr/local/bin/zsh"))

(use-package eterm-256color
  :ensure t
  :config
  (add-hook 'term-mode-hook #'eterm-256color-mode))

(provide 'term)
;;; term.el ends here
