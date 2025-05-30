;; config.el




(setq layer '(
              layer-evil ;; vi mode
              layer-magit ;; git interface
              layer-treesit
              layer-company
              ))
(add-to-list 'load-path (concat user-emacs-directory "layer"))
(dolist (layer layer)
  (require layer))



;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Appearance
;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs
  :custom
  (show-help-function nil)              ; No help
  (use-file-dialog nil)                 ; No file dialog
  (use-dialog-box nil)                  ; No dialog box
  (pop-up-windows nil)                  ; No popup windows
  (menu-bar-mode nil)                   ; Disable the menu bar
  (tool-bar-mode nil)                   ; Disable the tool bar
  (inhibit-startup-screen t)            ; Disable welcome screen
  (scroll-bar-mode nil)                 ; No scroll bars
  (blink-cursor-mode t)                 ; Don't blink cursor
  (global-display-line-numbers-mode t)  ; Display line numbers
  (scroll-conservatively 10)            ; Smoth scrolling
)


(setq nano-splash-timeout nil
      nano-splash-timeout-sec 5
      nano-font-height 140
      nano-default-font "Roboto Mono") ; `nano-default-font' should support 'light and 'normal font shades

(add-to-list 'load-path (concat user-emacs-directory "nano-emacs"))

(require 'nano-minimal)
(require 'nano-splash)

;; (nano-dark)
(nano-light)



(evil-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;
