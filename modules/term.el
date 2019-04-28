;;; package --- Summary
;;; Commentary:
;;; Code:

(defadvice term-handle-exit
    (after term-kill-buffer-on-exit activate)
  (if (one-window-p)
      (kill-buffer)
    (kill-buffer-and-window)))

(defun cube/open-term-at-directory (root-directory)
  "Open an `ansi-term` at ROOT-DIRECTORY."
  (interactive)
  (setq default-directory root-directory)
  (ansi-term (getenv "SHELL")))

(defun cube/open-term ()
  "Create an 'ansi-term' at the project root."
  (interactive)
  (if (projectile-project-p)
      (cube/open-term-at-directory (projectile-project-root))
    (cube/open-term-at-directory "~/")))

(defun cube/open-term-vertical ()
  "Create an 'ansi-term' at the project root in vertical split."
  (interactive)
  (split-window-right)
  (other-window 1)
  (if (projectile-project-p)
      (cube/open-term-at-directory (projectile-project-root))
    (cube/open-term-at-directory "~/")))

(defun cube/open-term-horizontal ()
  "Create an 'ansi-term' at the project root in horizontal split."
  (interactive)
  (split-window-below)
  (other-window 1)
  (if (projectile-project-p)
      (cube/open-term-at-directory (projectile-project-root))
    (cube/open-term-at-directory "~/")))

(global-set-key (kbd "C-c t o") 'cube/open-term)
(global-set-key (kbd "C-c t v") 'cube/open-term-vertical)
(global-set-key (kbd "C-c t h") 'cube/open-term-horizontal)

(provide 'term)
;;; term.el ends here
