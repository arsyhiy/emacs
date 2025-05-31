;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package vertico
  :defer t
  :custom
  (vertico-mode))

  (savehist-mode) ;; Enables save history mode

  (use-package marginalia
    :after vertico
    :init
    (marginalia-mode)
    :defer t)

  (use-package nerd-icons-completion
    :after marginalia
    :config
    (nerd-icons-completion-mode)
    :hook
    ('marginalia-mode-hook . 'nerd-icons-completion-marginalia-setup)
    :defer t)

(provide 'layer-vertico-marginalia)
;;; layer-vertico-marginalia.el ends here
