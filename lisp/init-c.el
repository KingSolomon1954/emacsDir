; init-c.el
;
; Settings for C/C++ development
;
; ------------------------------------------------------

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

(provide 'init-c)
