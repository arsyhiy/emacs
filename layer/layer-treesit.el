;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package treesit-auto
  :straight t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

 (straight-use-package 'tree-sitter)
 (straight-use-package 'tree-sitter-langs)
 (global-tree-sitter-mode)
 (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(provide 'layer-treesit)
;;; layer-treesit.el ends here
