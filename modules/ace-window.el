;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package ace-window
  :bind (("C-x o" . ace-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (custom-set-faces
   '(aw-leading-char-face
   ((t (:inherit ace-jump-face-foreground :height 2.0))))))

(provide 'ace-window)
;;; ace-window.el ends here
