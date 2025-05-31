;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package evil
  :straight t
  :defer t 
  :config
  (setq evil-want-keybinding nil)    ;; Disable evil bindings in other modes (It's not consistent and not good)
  (setq evil-want-C-u-scroll t)      ;; Set C-u to scroll up
  (setq evil-want-C-i-jump nil)      ;; Disables C-i jump
  (setq evil-undo-system 'undo-redo) ;; C-r to redo
  (setq org-return-follows-link t)  ;; Sets RETURN key in org-mode to follow links
  ;; Unmap keys in 'evil-maps. If not done, org-return-follows-link will not work
  :bind (:map evil-motion-state-map
              ("SPC" . nil)
              ("RET" . nil)
              ("TAB" . nil)))

(use-package evil-collection
  :after evil
  :defer t
  :config
  ;; Setting where to use evil-collection
  (setq evil-collection-mode-list '(dired ibuffer magit corfu vertico consult))
  (evil-collection-init))

;;(mapc (lambda (mode)
;;        (evil-set-initial-state mode 'emacs)) '(elfeed-show-mode
;;                                                elfeed-search-mode
;;                                                forge-pullreq-list-mode
;;                                                forge-topic-list-mode
;;                                                dired-mode
;;                                                dashboard-mode
;;                                                tide-references-mode
;;                                                image-dired-mode
;;                                                image-dired-thumbnail-mode
;;                                                eww-mode))

(evil-mode)

(provide 'layer-evil)
