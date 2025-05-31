;;; -*- lexical-binding: t; no-byte-compile: t; -*-

(use-package company
  :straight
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))

  ;; This is one of the values (together with company-idle-delay),
  ;; based on which Company auto-stars looking up completion candidates.
  ;; This option configures how many characters have to be typed in by a user before candidates start to be collected and displayed.
  ;; An often choice nowadays is to configure this option to a lower number than the default value of 3.
  (company-minimum-prefix-length 1)

  ;; This is the second of the options that configure Company’s auto-start behavior (together with company-minimum-prefix-length).
  ;; The value of this option defines how fast Company is going to react to the typed input,
  ;; such that setting company-idle-delay to 0 makes Company react immediately, nil disables auto-starting,
  ;; and a larger value postpones completion auto-start for that number of seconds. For an even fancier setup,
  ;; set this option value to a predicate function, as shown in the following example:
  (company-idle-delay 0)

  (company-show-numbers t)

  ;; This option allows to specify in which major modes company-mode can be enabled by (global-company-mode).
  ;; The default value of t enables Company in all major modes.
  ;; Setting company-global-modes to nil equal in action to toggling off global-company-mode.
  ;; Providing a list of major modes results in having company-mode enabled in the listed modes only.
  (global-company-mode t)

  ;; An annotation is a string that carries additional information about a candidate; such as a data type, function arguments,
  ;; or whatever a backend appoints to be a valuable piece of information about a candidate. By default,
  ;; the annotations are shown right beside the candidates. Setting the option value to t aligns annotations to the right side of the tooltip
  (company-tooltip-align-annotations t)

  ;; Controls the maximum number of the candidates shown simultaneously in the tooltip (the default value is 10).
  ;; When the number of the available candidates is larger than this option’s value, Company paginates the results.
  (company-tooltip-limit 4)
)

(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

(provide 'layer-company)
;;; layer-company.el ends here
