;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package flycheck
 :ensure t
 :init (global-flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'layer-flycheck)
;;; layer-flycheck.el ends here
