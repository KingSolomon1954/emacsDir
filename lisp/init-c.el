; init-c.el
;
; Settings for C/C++ development
;
; ------------------------------------------------------

(setq c-default-style "bsd"
      c-basic-offset 4)

; Make the _ not a word separator.
(add-hook 'c++-mode-hook
    (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c-mode-hook
    (lambda () (modify-syntax-entry ?_ "w")))

; init runs before package is loaded
; config runs after package is loaded
(use-package gtags
  :ensure t
  :hook ((c++-mode . gtags-mode)
         (c-mode   . gtags-mode))
  :bind (:map gtags-mode-map
         ("C-x C-g" . 'gtags-find-tag) 
         ("C-x C-o" . 'gtags-find-rtag)
         ("C-x C-v" . 'gtags-find-file)
         ("C-x C-t" . 'gtags-find-pattern)
         ("C-x C-;" . 'gtags-pop-stack)))

(provide 'init-c)
