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

; LUA mode
(use-package lua-mode
  :ensure t
  :mode (("\\.lua\\'"      . lua-mode)))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'init-json)
