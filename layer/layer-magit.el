;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package magit
  :straight t
  :defer t
	:commands magit-status)

(use-package diff-hl
  :hook ((dired-mode         . diff-hl-dired-mode-unless-remote)
  (magit-pre-refresh  . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))
  :init (global-diff-hl-mode))

(provide 'layer-magit)
;;; layer-magit.el ends here

