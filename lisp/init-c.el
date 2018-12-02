; init-c.el
;
; Settings for C/C++ development
;
; ------------------------------------------------------

(use-package cc-mode
  :ensure nil
  :hook (c-mode-common . (lambda ()
                           (c-set-style "bsd")
                           (modify-syntax-entry ?_ "w")
                           (setq c-basic-offset 4)
                           (abbrev-mode -1))))

; init runs before package is loaded
; config runs after package is loaded
(use-package gtags
  :ensure nil
  :hook ((c++-mode . gtags-mode)
         (c-mode   . gtags-mode))
  :bind (:map gtags-mode-map
         ("C-x C-g" . 'gtags-find-tag) 
         ("C-x C-o" . 'gtags-find-rtag)
         ("C-x C-v" . 'gtags-find-file)
         ("C-x C-t" . 'gtags-find-pattern)
         ("C-x C-;" . 'gtags-pop-stack)))

(provide 'init-c)
