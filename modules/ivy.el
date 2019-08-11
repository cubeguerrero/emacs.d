;;; package --- Summary
;;; Commentary:
;;; Code:
(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-c C-r" . ivy-resume))
  :config
  (ivy-mode 1)
  (setq ivy-height 20
        ivy-use-virtual-buffers t
        ivy-count-format "%d/%d "))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c /" . counsel-ag)))

(use-package swiper
  :ensure t
  :bind (("\C-s" . swiper)
         ("\C-r" . swiper)))

(provide 'ivy)
;;; ivy.el ends here
