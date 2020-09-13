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
(use-package ggtags
  :ensure t
  :hook ((c++-mode . ggtags-mode)
         (c-mode   . ggtags-mode))
  :bind (:map ggtags-mode-map
         ("C-x C-g" . 'ggtags-find-tag-dwim) 
         ("C-x C-o" . 'ggtags-find-reference)
         ("C-x C-v" . 'ggtags-find-file)
         ("C-x C-t" . 'ggtags-grep)
         ("C-x C-;" . 'ggtags-prev-mark)
         ("C-x ;"   . 'ggtags-next-mark)))

(provide 'init-c)
