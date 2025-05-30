;; config.el



(setq nano-splash-timeout nil
      nano-splash-timeout-sec 5
      nano-font-height 140
      nano-default-font "Roboto Mono") ; `nano-default-font' should support 'light and 'normal font shades

(add-to-list 'load-path (concat user-emacs-directory "nano-emacs"))

(require 'nano-minimal)
(require 'nano-splash)

;; (nano-dark)
(nano-light)

(setq layer '(
              layer-evil ;; vi mode
              layer-magit ;; git interface
              layer-treesit
              layer-company
              ))
(add-to-list 'load-path (concat user-emacs-directory "layer"))
(dolist (layer layer)
  (require layer))

