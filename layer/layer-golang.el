;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(defun ime-go-before-save ()
  (interactive)
  (when lsp-mode
    (lsp-organize-imports)
    (lsp-format-buffer)))

(use-package go-mode
  :defer t
  :straight t
  :config
  (add-hook 'go-mode-hook 'lsp-deferred)
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'ime-go-before-save))))

(provide 'layer-golang)
;;; layer-golang.el ends here
