; config.el


(require 'use-package-ensure) ;; Load use-package-always-ensure
(setq use-package-always-ensure t) ;; Always ensures that a package is installed
(setq package-archives '(("melpa" . "https://melpa.org/packages/") ;; Sets default package repositories
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/"))) ;; For Eat Terminal

(setq layer '(
              layer-evil ;; vi mode
              layer-magit ;; git interface
              layer-treesit
              layer-company
              layer-corfu
	      layer-orderless
	      layer-vertico-marginalia
	      layer-consult
	      layer-which-key
	      layer-flycheck
	      layer-lsp
	      layer-python
          layer-C
	  layer-golang
	  layer-org
	  layer-projectile
	  layer-yasnippet
	  layer-dashboard
	  layer-treemacs
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


(use-package nerd-icons
  :if (display-graphic-p))

(use-package nerd-icons-dired
  :hook (dired-mode . (lambda () (nerd-icons-dired-mode t))))

(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))


(set-face-attribute 'default nil
  :font "JetBrainsMonoNL NF-12.0:bold" ;; Set your favorite type of font or download JetBrains Mono
  :height 160
  :weight 'medium)
  ;; This sets the default font on all graphical frames created after restarting Emacs.
  ;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
  ;; are not right unless I also add this method of setting the default font.

  (add-to-list 'default-frame-alist '(font . "JetBrainsMonoNL NF-12.0:bold")) ;; Set your favorite font
  (setq-default line-spacing 0.12)

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

; Rainbow Delimiters
; Adds colors to brackets.
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

; Pretty self-explanatory
(setq-default use-short-answers t                     ; Replace yes/no prompts with y/n
  confirm-nonexistent-file-or-buffer nil) ; Ok to visit non existent files

; Sound
; Disable the bell (auditory or visual).
(setq-default visible-bell nil             ; No visual bell
              ring-bell-function 'ignore)  ; No bell

; Mouse behavior can be finely controlled using the mouse-avoidance-mode.
(setq-default mouse-yank-at-point t) ; Yank at point rather than pointer
(mouse-avoidance-mode 'exile)        ; Avoid collision of mouse with point

; Record cursor position from one session ot the other
(setq save-place-file (expand-file-name "saveplace" user-emacs-directory)
      save-place-forget-unreadable-files t)
(save-place-mode 1)

; Smoother scrolling.
(setq-default scroll-conservatively 101       ; Avoid recentering when scrolling far
              scroll-margin 2                 ; Add a margin when scrolling vertically
              recenter-positions '(5 bottom)) ; Set re-centering positions
