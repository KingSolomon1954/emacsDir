; init-general.el
;
; General settings, that don't fit in their file
;
; ------------------------------------------------------

; disable backup
(setq backup-inhibited t)
; disable auto save
(setq auto-save-default nil)

; disable shift-selection
; If you hold down the shift key while typing a cursor
; motion command, this sets the mark before moving point.
(setq shift-select-mode nil)

; No tabs please
(setq-default indent-tabs-mode nil)

; Type opening brace and closing brace appears too
; (electric-pair-mode t)

; Highlight matching parens when cursor is behind one of them
(show-paren-mode 1)

; (when (eq system-type 'darwin)
;     (set-face-attribute 'default t :font "lucidasanstypewriter-11" )
; )

; Answer "y" instead "yes"
(fset 'yes-or-no-p 'y-or-n-p)

; Seems this is on by default. Don't want it.
(setq-default abbrev-mode nil)

; Each successive level of parens is highlighted a different color.
;
; For me, not enough color contrast on parens to make this worthwhile.
; Possible to change colors though. Maybe in the future.
;
; (use-package rainbow-delimiters
;   :ensure t)

; Supports normal markdown and GFM (Github Flavored Markdown).
(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'"       . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :config
  (setq markdown-fontify-code-blocks-natively t))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'init-general)

