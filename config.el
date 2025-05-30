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


;; good defaults
(use-package emacs
  :custom
  (when (>= emacs-major-version 29)
  (pixel-scroll-precision-mode 1))
  (show-help-function nil)    ; No help text
  (use-file-dialog nil)       ; No file dialog
  (use-dialog-box nil)        ; No dialog box
  (pop-up-windows nil)       ; No popup windows
  (menu-bar-mode nil)         ;; Disable the menu bar
  (tool-bar-mode nil)         ;; Disable the tool bar
  ;;(inhibit-startup-screen t)  ;; Disable welcome screen
  (scroll-bar-mode nil)                    ; No scroll bars
  (delete-selection-mode t)   ;; Select text and delete it by typing.
  (electric-indent-mode nil)  ;; Turn off the weird indenting that Emacs does by default.
  (electric-pair-mode t)      ;; Turns on automatic parens pairing
  (select-enable-clipboard t) ; Merge system's and Emacs' clipboard
  (blink-cursor-mode t)     ;; Don't blink cursor
  (global-auto-revert-mode t) ;; Automatically reload file and show changes if the file has changed

  ;;(dired-kill-when-opening-new-dired-buffer t) ;; Dired don't create new buffer
  ;;(recentf-mode t) ;; Enable recent file mode

  ;;(global-visual-line-mode t)           ;; Enable truncated lines
  ;;(display-line-numbers-type 'relative) ;; Relative line numbers
  (global-display-line-numbers-mode t)  ;; Display line numbers

  (mouse-wheel-progressive-speed t) ;; Disable progressive speed when scrolling
  (scroll-conservatively 10) ;; Smooth scrolling
  ;;(scroll-margin 8)

  (tab-width 2)
  (setq-default indent-tabs-mode nil)

  (make-backup-files nil) ;; Stop creating ~ backup files
  (auto-save-default nil) ;; Stop creating # auto save files
  :hook
  (prog-mode . (lambda () (hs-minor-mode t))) ;; Enable folding hide/show globally
  :config
  ;; Move customization variables to a separate file and load it, avoid filling up init.el with unnecessary variables
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)
  :bind (
           ([escape] . keyboard-escape-quit) ;; Makes Escape quit prompts (Minibuffer Escape)
           )
  ;; Fix general.el leader key not working instantly in messages buffer with evil mode
  ;;:ghook ('after-init-hook
  ;;       (lambda (&rest _)
  ;;          (when-let ((messages-buffer (get-buffer "*Messages*")))
  ;;          (with-current-buffer messages-buffer
  ;;          (evil-normalize-keymaps))))
  ;;          nil nil t)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Appearance
;;;;;;;;;;;;;;;;;;;;;;;;;;



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
