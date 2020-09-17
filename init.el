;------------------------------------------------------
;
; init.el - my emacs startup file
;
;------------------------------------------------------
;
; Speed up startup
;
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(setq gc-cons-threshold 4000000)
(add-hook 'emacs-startup-hook
          (lambda ()
            "Restore defalut values after init."
            (setq file-name-handler-alist default-file-name-handler-alist)
            (setq gc-cons-threshold 800000)
            (add-hook 'focus-out-hook 'garbage-collect)))

; Load path
; Optimize: Place "lisp"" at the head to reduce the startup time.
(defun update-load-path (&rest _)
   "Update `load-path'."
   (push (expand-file-name "lisp" user-emacs-directory) load-path))

; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

; (advice-add #'package-initialize :after #'update-load-path)

(update-load-path)

; ------------------------------------------------------
;
; Packages
; Without this comment Emacs25 adds (package-initialize) here
(require 'init-package)

(require 'init-ui)
(require 'init-funcs)
(require 'init-general)
(require 'init-multicursors)
(require 'init-keys)
(require 'init-c)
(require 'init-git)
(require 'init-open)
(require 'init-json)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ggtags yaml-mode use-package markdown-mode lua-mode json-mode flycheck adoc-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
