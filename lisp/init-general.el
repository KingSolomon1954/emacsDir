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

; Make the _ not a word separator.
(add-hook 'c++-mode-hook
    (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c-mode-hook
    (lambda () (modify-syntax-entry ?_ "w")))

(setq c++-mode-hook
    '(lambda ()
       (gtags-mode 1)
))

; (when (require 'gtags-mode nil 't)
;     (setq c++-mode-hook
;         '(lambda ()
;            (gtags-mode 1)
;     ))
; )

(setq gtags-mode-hook
    '(lambda ()
        (define-key gtags-mode-map (kbd "C-x C-g") 'gtags-find-tag)
        (define-key gtags-mode-map (kbd "C-x C-o") 'gtags-find-rtag)
        (define-key gtags-mode-map (kbd "C-x C-v") 'gtags-find-file)
        (define-key gtags-mode-map (kbd "C-x C-t") 'gtags-find-pattern)
        (define-key gtags-mode-map (kbd "C-x C-;") 'gtags-pop-stack)
        (define-key gtags-select-mode-map (kbd "C-x C-;") 'gtags-pop-stack)
))

(setq c-default-style "bsd"
      c-basic-offset 4)
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
)

(when (equal system-type 'windows-nt)
    (custom-set-faces
    ;; custom-set-faces was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
    '(default ((t (:family "Lucida Console" :foundry "outline" :slant normal :weight normal :height 90 :width normal)))))
)

; (when (eq system-type 'darwin)
;     (set-face-attribute 'default t :font "lucidasanstypewriter-11" )
; )

; Answer "y" instead "yes"
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-general)
