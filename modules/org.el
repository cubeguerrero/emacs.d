;;; package --- Summary
;;; Commentary:
;;; Code:
(load-library "find-lisp")
(use-package org
  :ensure t
  :mode ("\\.org$" . org-mode)
  :bind (("C-c o a" . org-agenda)
         ("C-c o c" . org-capture)
         ("C-c o b" . org-iswitchb))
  :config
  (setq org-hide-leading-stars t
        org-src-fontify-natively t
        org-startup-with-inline-images t
        org-log-done 'time)

  (if (string-equal (system-name) "17853-cguerrero.local")
      (setq org-directory "~/Google Drive/Org")
    (setq org-directory "~/Dropbox/Org"))
  
  (setq org-inbox-file (concat org-directory "/inbox.org")
        org-projects-file (concat org-directory "/projects.org")
        org-notes-file (concat org-directory "/notes.org")
        org-tickler-file (concat org-directory "/tickler.org"))

  (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
  (setq org-agenda-files `(,org-inbox-file
                           ,org-projects-file
                           ,org-tickler-file))
  
  (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-use-outline-path file)
  (setq org-refile-allow-creating-parent-nodes 'confirm)

  ;; Set org-capture templates
  (setq org-capture-templates '(("t" "Todo [inbox]" entry (file org-inbox-file) "* TODO %i%?")
                                ("T" "Tickler" entry (file+headline "~/Dropbox/Org/tickler.org" "Tickler") "* %i%? \n %U")
                                ("n" "Note" entry (file org-notes-file) "* NOTE %?\n%U" :empty-lines 1))))

(use-package org-download
  :ensure t)

(use-package org-bullets
  :ensure t
  :commands (org-bullets-mode)
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


(provide 'morg)
;;; org.el ends here
