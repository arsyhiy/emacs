; config.el




(setq layer '(
              layer-evil ;; vi mode
              layer-magit ;; git interface
              layer-treesit
              layer-company
              layer-corfu
	      layer-orderless
	      layer-vertico-marginalia
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

; Global variables
(setq globals--leader-key   "<SPC>") ; Leader prefix key used for most bindings

; remaps RET
(global-set-key (kbd "RET") 'newline-and-indent)


;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utilities
;;;;;;;;;;;;;;;;;;;;;;;;;;

; deleting ^M character
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

; Zooming In/Out
; You can use the bindings C-+ C– for zooming in/out. You can also use CTRL plus the mouse wheel for zooming in/out.
(use-package emacs
  :bind
  ("C-+" . text-scale-increase)
  ("C--" . text-scale-decrease)
  ("<C-wheel-up>" . text-scale-increase)
  ("<C-wheel-down>" . text-scale-decrease))


; Default to utf-8 encoding.
(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
