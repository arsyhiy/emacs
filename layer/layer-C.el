;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package cc-mode
  :ensure nil
  :config
  ;;; Open a header file in C++ mode by default
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))

(provide 'layer-C)
;;; layer-C.el ends here
