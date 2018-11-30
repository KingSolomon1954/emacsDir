; init-package.el
;
; Setup for package managment itself.
; Peek at https://github.com/yehoodig/dot-files/blob/master/emacs/.emacs.d/init.el
;
; ------------------------------------------------------

(require 'package)

(when (>= emacs-major-version 24)
    (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
    (add-to-list 'package-archives '("marmalade"    . "http://marmalade-repo.org/packages/") t))

(setq package-enable-at-startup nil)
(package-initialize)

; Should set before loading `use-package'
(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(setq use-package-expand-minimally t)
(setq use-package-enable-imenu-support t)

; Bootstrap "use-package"
; See docs on use-package here: https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
    (require 'use-package))

; Required by `use-package'
(use-package diminish)
(use-package bind-key)

(provide 'init-package)

; ------------------------------------------------------
