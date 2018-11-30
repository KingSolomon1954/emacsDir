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
(setq gc-cons-threshold 80000000)
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
(advice-add #'package-initialize :after #'update-load-path)

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
