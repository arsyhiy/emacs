;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion))))
  :defer t)

(provide 'layer-orderless)
;;; layer-orderless.el ends here
