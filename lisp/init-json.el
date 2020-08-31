; init-json.el
;
; Bring in various file editing modes
;
; ------------------------------------------------------

(use-package json-mode
  :ensure t)

; Supports normal markdown and GFM (Github Flavored Markdown).
(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'"       . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :config
  (setq markdown-fontify-code-blocks-natively t))

; Supports normal markdown and GFM (Github Flavored Markdown).
(use-package yaml-mode
  :ensure t
  :mode (("\\.yml\\'"       . yaml-mode)))

; asciidoc mode
(use-package adoc-mode
  :ensure t
  :mode (("\\.adoc\\'"      . adoc-mode)))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

; init runs before package is loaded
; config runs after package is loaded
;(use-package gtags
;  :ensure t
;  :hook ((c++-mode . gtags-mode)
;         (c-mode   . gtags-mode))
;  :bind (:map gtags-mode-map
;         ("C-x C-g" . 'gtags-find-tag) 
;         ("C-x C-o" . 'gtags-find-rtag)
;         ("C-x C-v" . 'gtags-find-file)
;         ("C-x C-t" . 'gtags-find-pattern)
;         ("C-x C-;" . 'gtags-pop-stack)))

(provide 'init-json)
